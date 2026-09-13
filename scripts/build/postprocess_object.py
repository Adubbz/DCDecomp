#!/usr/bin/env python3
"""Apply symbol-derived and configured fixes to a compiled object."""

import argparse
import functools
import json
import os
import re
import struct
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).parents[2]
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(ROOT / "tools" / "mwccgap"))

from mwccgap.elf import Elf  # noqa: E402
from scripts.build import disassemble  # noqa: E402


LOCAL_STATIC = re.compile(r"^(.+)\$(\d+)(?:__\d+)?$")
STATIC_RELOCATION = re.compile(r"%(?:gp_rel|hi|lo)\(([^)]+\$\d+(?:__\d+)?)\)")


def local_static_aliases(elf, source):
    """Pair MWCC local statics with the retail names used by their unit."""
    # What the object holds decides whether there is anything to pair, and it
    # is already in hand -- reading the unit's reference assembly and retail's
    # symbol table costs more than compiling most objects does.
    compiled_groups = defaultdict(list)
    for symbol in elf.symtab.symbols:
        match = LOCAL_STATIC.match(symbol.name)
        if match:
            compiled_groups[match.group(1)].append(symbol.name)
    if not compiled_groups:
        return {}

    unit = next(
        (row for row in disassemble.read_units() if row[2] == source), None
    )
    if unit is None or not Path(unit[3]).exists():
        return {}

    _kind, _image, _source, reference = unit
    text = Path(reference).read_text(encoding="utf-8")
    text = disassemble.restore_gp_relative_relocations(
        Path(reference), text, disassemble.read_symbol_table(),
        disassemble.image_of_file())
    retail = set(STATIC_RELOCATION.findall(text))
    retail_groups = defaultdict(list)
    for name in retail:
        match = LOCAL_STATIC.match(name)
        if match:
            retail_groups[match.group(1)].append(name)

    # Two run-once guards in one scope cannot both be spelled `init`, so the
    # source calls the second `init2`; retail's compiler had no such trouble
    # and named both `init`. Fold a trailing digit into the retail base name so
    # the two are matched as one family.
    def family(base):
        if base in retail_groups:
            return base
        stripped = base.rstrip("0123456789")
        return stripped if stripped in retail_groups else None

    families = defaultdict(list)
    for base, compiled in compiled_groups.items():
        name = family(base)
        if name is not None:
            families[name] += compiled

    aliases = {}
    for key, compiled in families.items():
        expected = retail_groups[key]
        if len(compiled) != len(expected):
            continue
        compiled.sort(key=lambda name: int(LOCAL_STATIC.match(name).group(2)))
        expected.sort(key=lambda name: int(LOCAL_STATIC.match(name).group(2)))
        aliases.update(
            (old, new) for old, new in zip(compiled, expected) if old != new
        )
    return aliases


# A constant's bytes as the reference dump writes them: the third field of
# spimdisasm's address comment, in the order the file stores them.
DUMP_BYTES = re.compile(
    r"^\s*/\*\s*[0-9A-Fa-f]+\s+[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s*\*/")


@functools.lru_cache(maxsize=None)
def unit_dumps():
    """The reference dumps that hold a whole unit rather than one symbol each.

    An overlay is disassembled as one file, so a constant of its only unit has
    no dump of its own to be found by name.
    """
    return sorted(p for p in ROOT.glob("asm/*/*.s")
                  if not p.parent.name.startswith(("nonmatchings", "matchings", "data")))


def retail_constant(name):
    """The bytes retail's dump holds for one named constant."""
    paths = (list(sorted(ROOT.glob("asm/**/%s.s" % name)))
             + list(sorted(ROOT.glob("asm/data/*/*.data.s")))
             + unit_dumps())
    for path in paths:
        text = path.read_text(encoding="utf-8", errors="ignore")
        match = re.search(glabel_pattern(name), text, re.M)
        if not match:
            continue
        out = bytearray()
        for line in text[match.end():].split("\n")[1:]:
            if line.startswith("glabel") or line.lstrip().startswith(".section"):
                break
            word = DUMP_BYTES.match(line)
            if word:
                out += bytes.fromhex(word.group(1))
        if out:
            return bytes(out)
    return None


def compiled_constants(path):
    """Every local `@N` constant the object defines, with its bytes."""
    data = path.read_bytes()
    e_shoff, = struct.unpack_from("<I", data, 0x20)
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from("<HHH", data, 0x2E)

    def header(index):
        return struct.unpack_from("<10I", data, e_shoff + index * e_shentsize)

    sections = [header(i) for i in range(e_shnum)]

    def contents(index):
        _n, sh_type, _f, _a, off, size = sections[index][:6]
        return b"" if sh_type == 8 else data[off:off + size]   # SHT_NOBITS

    out = {}
    for index, (_n, sh_type, _f, _a, off, size, link, _i, _al, entsize) in \
            enumerate(sections):
        if sh_type != 2:                                       # SHT_SYMTAB
            continue
        names = contents(link)
        for i in range(size // entsize):
            st_name, _v, _sz, st_info, _o, st_shndx = struct.unpack_from(
                "<IIIBBH", data, off + i * entsize)
            if st_info >> 4 != 0 or not st_name:               # STB_LOCAL only
                continue
            end = names.index(b"\0", st_name)
            symbol = names[st_name:end].decode()
            if symbol.startswith("@") and st_shndx < len(sections):
                out.setdefault(symbol, contents(st_shndx))
    return out


def export_constants(path, names, parser, assembly_constants=(),
                     reserved_constants=()):
    """Rename the object's own constants to the names retail's other units use.

    A translation unit that is only half decompiled has its string constants
    generated by the compiled half under invented `@N` names, while the
    assembly half still refers to them by the name splat took from retail.
    Matching the two by content is what lets the dump stop supplying a second
    copy -- which is what moves the small data after it.
    """
    if not names:
        return
    # INCLUDE_RODATA may already have spliced an undecompiled constant into
    # the object. In that case it has its retail name and needs no compiler
    # constant alias.
    elf = Elf(path.read_bytes())
    defined = {
        symbol.name
        for symbol in elf.symtab.symbols
        if symbol.st_shndx != 0
    }
    compiled_symbols = {
        symbol.name: symbol
        for symbol in elf.symtab.symbols
        if symbol.bind == 0 and symbol.name.startswith("@")
        and 0 < symbol.st_shndx < len(elf.sections)
    }
    compiled = {
        name: elf.sections[symbol.st_shndx].data
        for name, symbol in compiled_symbols.items()
    }
    # A configured symbol rename or INCLUDE_RODATA may already have assigned a
    # constant its retail name. Reserve such constants so an identical byte
    # sequence cannot also satisfy a later content-based export.
    reserved = (set(reserved_constants) | set(assembly_constants)) & defined
    arguments = []
    padded = False
    for name in names:
        if name in defined:
            continue
        wanted = retail_constant(name)
        if wanted is None:
            parser.error(f"no reference assembly defines {name!r}")
        matches = [symbol for symbol, body in compiled.items()
                   if symbol not in reserved and body and wanted.startswith(body)]
        if not matches and name in assembly_constants:
            continue
        if len(matches) != 1:
            parser.error(f"{name!r} matches {len(matches)} constants in {path}")
        # MWLD recognizes a local `@N` as a compiler constant and rounds its
        # contribution to eight bytes, ignoring a larger section alignment.
        # Preserve the explicit zero tail in retail's dump inside the section
        # itself so the following constant still begins at its retail address.
        old = matches[0]
        section = elf.sections[compiled_symbols[old].st_shndx]
        if len(wanted) > len(section.data):
            tail = wanted[len(section.data):]
            if any(tail):
                parser.error(f"{name!r} has nonzero bytes beyond its compiler "
                             f"constant in {path}")
            section.data = wanted
            section.sh_size = len(wanted)
            compiled[old] = wanted
            padded = True
        arguments += ["--redefine-sym", f"{old}={name}",
                      "--globalize-symbol", name]
    if padded:
        path.write_bytes(elf.pack())
    objcopy = os.environ.get("MIPS_TOOL_PREFIX", "mips-ps2-decompals-") + "objcopy"
    subprocess.run([objcopy] + arguments + [str(path), str(path)], check=True)



def rename_symbols(path, mappings):
    """Spell the unit's own symbols the way the reference assembly does.

    Retail gives two functions in different images the same mangled name, and
    the disassembler tells them apart with a `__N` suffix that the source
    cannot write. Renaming the object's definition and its references together
    keeps the call inside the unit, rather than letting it resolve against the
    other image's copy.
    """
    if not mappings:
        return
    arguments = []
    for old, new in mappings.items():
        arguments += ["--redefine-sym", f"{old}={new}"]
    objcopy = os.environ.get("MIPS_TOOL_PREFIX", "mips-ps2-decompals-") + "objcopy"
    subprocess.run([objcopy] + arguments + [str(path), str(path)], check=True)


def globalize_symbols(path, names):
    """Expose local functions referenced by retained cross-unit data tables."""
    if not names:
        return
    objcopy = os.environ.get("MIPS_TOOL_PREFIX", "mips-ps2-decompals-") + "objcopy"
    arguments = [value for name in names for value in ("--globalize-symbol", name)]
    subprocess.run([objcopy] + arguments + [str(path), str(path)], check=True)


# Every datum retail places in .sdata or .sbss starts on a four-byte boundary,
# whatever its own type needs: the two-byte `rpad$180` is followed by two bytes
# of padding, and each one-byte flag by three. MWCC gives each static a section
# of its own with the alignment of its type, so a `char` lands wherever the
# previous datum ended and every gp-relative offset after it is short.
SMALL_DATA_ALIGNMENT = 4
SMALL_DATA_SECTIONS = (".sdata", ".sbss")

# Retail starts every constant on an eight-byte boundary, whatever its own
# length asks for: `"IMG"` follows an eighteen-byte name at 0x299028 rather than
# at 0x299024. MWCC gives a constant of four bytes or fewer a section of
# four-byte alignment, so without this the short ones pull everything after them
# forward.
RODATA_ALIGNMENT = 8

# A constant the reference assembly still supplies arrives asking for sixteen,
# because that is what splat writes at the head of every dump. Retail granted
# that to some and not to others -- 121 of the map editor's 283 constants sit
# where eight divides and sixteen does not -- so where the address is known it
# is the address, rather than either compiler's habit, that says how wide the
# slot is.
RODATA_ALIGNMENTS = (16, 8, 4)


@functools.lru_cache(maxsize=None)
def retail_addresses():
    """Every symbol the configuration gives an address, by name."""
    out = {}
    for path in sorted(ROOT.glob("config/*.symbols.txt")):
        for line in path.read_text(encoding="utf-8").splitlines():
            match = re.match(r"(\S+) = (0x[0-9a-fA-F]+);", line.strip())
            if match:
                out.setdefault(match.group(1), int(match.group(2), 16))
    return out


def rodata_alignment(names):
    """The slot retail gave a constant, or none where it names no address."""
    for name in names:
        # MWCC assigns @N independently in every translation unit. A compiled
        # @N can share a spelling with an unrelated retail constant, so its
        # number cannot be used as an address-stable identity. Transplanted
        # retail constants are still named .rodata.gap at this point and do
        # not pass through this fallback.
        if name.startswith("@"):
            continue
        address = retail_addresses().get(name)
        if address:
            return next(a for a in RODATA_ALIGNMENTS if address % a == 0)
    return None


def align_small_data(elf):
    """Give each small-data section retail's four-byte slot."""
    defined = defaultdict(list)
    for symbol in elf.symtab.symbols:
        if symbol.st_shndx and symbol.st_shndx < len(elf.sections):
            defined[symbol.st_shndx].append(symbol.name)
    for index, section in enumerate(elf.sections):
        if (section.name in SMALL_DATA_SECTIONS
                and section.sh_addralign < SMALL_DATA_ALIGNMENT):
            section.sh_addralign = SMALL_DATA_ALIGNMENT
        elif section.name == ".rodata":
            wanted = rodata_alignment(defined.get(index, ()))
            if wanted is not None:
                section.sh_addralign = wanted
            elif section.sh_addralign < RODATA_ALIGNMENT:
                section.sh_addralign = RODATA_ALIGNMENT


def rename_sections(elf, mappings, parser):
    """Rename the sections that define configured symbols.

    A compiler-numbered constant only carries its retail name once
    export_constants has bound it, so an entry naming one is handed back for
    a second pass over the written object.
    """
    symbols = {symbol.name: symbol for symbol in elf.symtab.symbols}
    renamed = {}
    deferred = {}
    for section_name, names in mappings.items():
        name_index = elf.add_sh_symbol(section_name)
        for symbol_name in names:
            symbol = symbols.get(symbol_name)
            if symbol is None:
                if NUMBERED_DATUM.match(symbol_name):
                    deferred.setdefault(section_name, []).append(symbol_name)
                    continue
                parser.error(f"{symbol_name!r} is not defined")
            index = symbol.st_shndx
            if index in renamed and renamed[index] != section_name:
                parser.error(f"section {index} has conflicting names")
            elf.sections[index].sh_name = name_index
            elf.sections[index].name = section_name
            renamed[index] = section_name
    return deferred


# A datum the compiler invented a name for: `@N`, or a function-local static
# named `name$N`.
NUMBERED_DATUM = re.compile(r"^(?:@\d+|[A-Za-z_]\w*\$\d+)(?:__\d+)?$")


def glabel_pattern(name):
    """Match an assembly global label with an optional pair of quotes."""
    return r'^glabel "?%s"?$' % re.escape(name)


def dump_data_symbols(name):
    """The symbols of the `.data` dump that defines `name`, in address order."""
    for path in sorted(ROOT.glob("asm/data/*/*.data.s")):
        text = path.read_text(encoding="utf-8", errors="ignore")
        if not re.search(glabel_pattern(name), text, re.M):
            continue
        out, pending = [], None
        for line in text.splitlines():
            label = re.match(r'glabel "?([^"\s]+)"?\s*$', line)
            if label:
                pending = label.group(1)
            elif pending and DUMP_BYTES.match(line):
                out.append(pending)
                pending = None
        return out
    return []


def data_runs(elf, runs, parser):
    """Give a unit's later runs of generated data a section name of their own.

    MWLD hands every same-named section of an object to the first linker script
    line that names it, so a unit whose generated data is interleaved with the
    dump's own globals needs one name per run. A run is keyed by the retail name
    of the constant it starts with: the object's data sections and the dump's
    compiler-numbered symbols are both in emission order, so their positions
    correspond, and a length that disagrees is a template the source has gained
    or lost.
    """
    if not runs:
        return
    sections = [index for index, section in enumerate(elf.sections)
                if section.name == ".data" and section.sh_size]
    retail = [name for name in dump_data_symbols(next(iter(runs.values())))
              if NUMBERED_DATUM.match(name)]
    if len(sections) != len(retail):
        parser.error("the object has %d generated data sections and the dump "
                     "%d; the source has gained or lost a template"
                     % (len(sections), len(retail)))
    for section_name, start in runs.items():
        if start not in retail:
            parser.error(f"the dump defines no {start!r}")
        name_index = elf.add_sh_symbol(section_name)
        for index in sections[retail.index(start):]:
            elf.sections[index].sh_name = name_index
            elf.sections[index].name = section_name


DISCARD_SECTION = ".discard"
MWCATS_PREFIX = ".mwcats_"


def drop_functions(elf, names, parser):
    """Keep a function out of the link without keeping it out of the compile.

    A few of the movie's units carry a function nothing calls and retail's link
    removed. They cannot simply be deleted: the compiler carries state from one
    definition to the next, and taking one out moves the constants of the
    definitions after it. MWLD lays a section out whatever its flags say, so
    the section is given a name of its own here and objcopy takes it away
    below; the compiler still saw the definition.
    """
    if not names:
        return
    wanted = set(names)
    # MWCC names a function the linker may merge in a `.mwcats` section of its
    # own, under a section symbol spelling the function. Only the entry for a
    # function going away may be taken with it: the rest are what let MWLD keep
    # one copy of a constructor the compiler wrote itself.
    markers = {MWCATS_PREFIX + name for name in names}
    name_index = elf.add_sh_symbol(DISCARD_SECTION)
    for symbol in elf.symtab.symbols:
        if symbol.name in wanted | markers and symbol.st_shndx:
            section = elf.sections[symbol.st_shndx]
            section.sh_name = name_index
            section.name = DISCARD_SECTION
            wanted.discard(symbol.name)
    if wanted:
        parser.error("the object defines no %s" % ", ".join(sorted(wanted)))


# Where a transplanted function's constants land. mwccgap gives them a section
# of their own so the second compile can tell them from the ones it wrote; by
# here they are ordinary constants again. Renaming it through objcopy rebuilds
# the symbol table and turns MWCC's coalesced globals local, which costs the
# link a copy of every constructor the compiler wrote itself, so it is done
# here instead -- and only for the objects that carry one.
TRANSPLANTED_RODATA = ".rodata.gap"


def restore_transplanted_rodata(elf):
    """Fold mwccgap's constants back into .rodata."""
    renamed = [index for index, section in enumerate(elf.sections)
               if section.name == TRANSPLANTED_RODATA]
    if not renamed:
        return
    name_index = elf.add_sh_symbol(".rodata")
    for index in renamed:
        elf.sections[index].sh_name = name_index
        elf.sections[index].name = ".rodata"
    # The section symbol carries the name a second time, and MWLD reads it
    # from there when it reports where a constant was meant to go.
    for symbol in elf.symtab.symbols:
        if symbol.name == TRANSPLANTED_RODATA and symbol.st_shndx in renamed:
            symbol.name = ".rodata"
            symbol.st_name = elf.strtab.add_symbol(".rodata")


# A constructor or destructor MWCC writes itself, which every unit that needs
# its address emits a copy of. Retail's overlay carries none of them: its units
# reach the one copy main holds.
GENERATED_MEMBER = re.compile(r"^__(?:ct|dt)__")


def extern_functions(elf, names, parser):
    """Let a unit reach main's copy instead of laying out its own.

    MWLD keeps one copy of a constructor the compiler wrote itself only when
    every copy is one the compiler wrote: retail's is assembled, at a fixed
    address in main, so a compiled copy beside it is a second definition and
    the link fails. The definition goes in the section objcopy takes away
    below and the symbol is left undefined, which is what the relocation
    needs to bind to main's.
    """
    if not names:
        return
    wanted = set(names)
    name_index = elf.add_sh_symbol(DISCARD_SECTION)
    for symbol in elf.symtab.symbols:
        if symbol.name in wanted and symbol.st_shndx:
            section = elf.sections[symbol.st_shndx]
            section.sh_name = name_index
            section.name = DISCARD_SECTION
            symbol.st_shndx = 0
            symbol.st_value = 0
            symbol.st_size = 0
            wanted.discard(symbol.name)
    if wanted:
        parser.error("the object defines no %s" % ", ".join(sorted(wanted)))


def shared_constant_name(text):
    """The name two units reach one constant by."""
    return "_S_" + re.sub(r"\W", "_", text)


def constant_sections(elf, wanted):
    """{text: symbol} for each wanted string the object holds its own copy of."""
    found = {}
    for symbol in elf.symtab.symbols:
        if not symbol.st_shndx or symbol.st_shndx >= len(elf.sections):
            continue
        data = elf.sections[symbol.st_shndx].data
        for text in wanted:
            if data is not None and data.startswith(text.encode() + b"\0") \
                    and len(data) - len(text) - 1 < 16:
                found.setdefault(text, symbol)
    return found


def share_constants(elf, exported, imported, parser):
    """Keep one copy of a constant two units use, the way retail's link has it.

    MWCC gives every unit its own copy of a string it names, and MWLD merges
    none of them: retail's own image holds `opdat/chara/01p19a1a.chr` once, in
    op_a, with op_b's table pointing at it. Whichever unit retail leaves it in
    names it here and exports it; the others drop their copy and reach that one.
    """
    if not exported and not imported:
        return
    found = constant_sections(elf, list(exported) + list(imported))
    missing = [t for t in list(exported) + list(imported) if t not in found]
    if missing:
        parser.error("the object holds no %s" % ", ".join(repr(m) for m in missing))
    for text in exported:
        symbol = found[text]
        symbol.name = shared_constant_name(text)
        symbol.st_name = elf.strtab.add_symbol(symbol.name)
        symbol.st_info = (1 << 4) | (symbol.st_info & 0xF)     # STB_GLOBAL
    if imported:
        name_index = elf.add_sh_symbol(DISCARD_SECTION)
        for text in imported:
            symbol = found[text]
            section = elf.sections[symbol.st_shndx]
            section.sh_name = name_index
            section.name = DISCARD_SECTION
            symbol.name = shared_constant_name(text)
            symbol.st_name = elf.strtab.add_symbol(symbol.name)
            symbol.st_info = (1 << 4) | (symbol.st_info & 0xF)
            symbol.st_shndx = 0
            symbol.st_value = 0
            symbol.st_size = 0


def coalesced_functions(elf):
    """The constructors MWCC wrote itself, which have to stay global.

    MWCC emits one of these global but places it among the local symbols, and
    every objcopy pass rebuilds the table from `sh_info` and so demotes it. A
    local copy is a second definition, which MWLD lays out in full rather than
    binding the reference to the one main already holds. Nothing else in the
    catalogue needs this: a function the source wrote is global already, and
    globalizing one is what it already is.
    """
    return sorted(
        name[len(MWCATS_PREFIX):]
        for name in {symbol.name for symbol in elf.symtab.symbols}
        if name.startswith(MWCATS_PREFIX)
        and GENERATED_MEMBER.match(name[len(MWCATS_PREFIX):])
    )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("object", type=Path)
    parser.add_argument("source")
    parser.add_argument("--config", type=Path,
                        default=ROOT / "config" / "object_fixups.json")
    args = parser.parse_args()

    elf = Elf(args.object.read_bytes())
    aliases = local_static_aliases(elf, args.source)
    for symbol in elf.symtab.symbols:
        replacement = aliases.get(symbol.name)
        if replacement:
            symbol.name = replacement
            symbol.st_name = elf.strtab.add_symbol(replacement)

    align_small_data(elf)

    config = json.loads(args.config.read_text(encoding="utf-8"))
    fixups = config.get(args.source, {})
    restore_transplanted_rodata(elf)
    drop_functions(elf, fixups.get("drop_functions", []), parser)
    extern_functions(elf, fixups.get("extern_functions", []), parser)
    share_constants(elf, fixups.get("export_constants_shared", []),
                    fixups.get("import_constants_shared", []), parser)
    # Every objcopy pass rebuilds the symbol table from `sh_info`, and MWCC
    # puts a global that belongs after it among the locals, so each pass
    # demotes it. fixup_sections.sh is the last one over the object: it reads
    # this list back and restores them there, after nothing else can undo it.
    Path(str(args.object) + ".coal").write_text(
        "".join(name + "\n" for name in
                coalesced_functions(elf) +
                [shared_constant_name(text)
                 for text in fixups.get("export_constants_shared", [])]),
        encoding="utf-8")
    deferred_sections = rename_sections(elf, fixups.get("sections", {}), parser)
    data_runs(elf, fixups.get("data_runs", {}), parser)
    args.object.write_bytes(elf.pack())

    # After the rewrite: objcopy reads the file, so these have to be last.
    dropped = fixups.get("drop_functions", [])
    if dropped or fixups.get("extern_functions") \
            or fixups.get("import_constants_shared"):
        objcopy = os.environ.get("MIPS_TOOL_PREFIX", "mips-ps2-decompals-") + "objcopy"
        arguments = ["--wildcard", "--remove-section", DISCARD_SECTION]
        # the symbol has to go with the section it stood in, or objcopy calls
        # it required but not present
        for name in dropped:
            arguments += ["--strip-symbol", name]
        subprocess.run([objcopy] + arguments + [str(args.object), str(args.object)],
                       check=True)

    rename_symbols(args.object, fixups.get("symbols", {}))
    # GNU assembly cannot spell MWCC's angle-bracket template names. Splat
    # uses the same deterministic safe spelling for definitions and callers.
    native_symbols = {
        symbol.name for symbol in Elf(args.object.read_bytes()).symtab.symbols
        if "<" in symbol.name
    }
    template_aliases = {
        name: name.replace("<", "_").replace(",", "_")
                  .replace(">", "_").replace(" ", "")
        for name in native_symbols
    }
    rename_symbols(args.object, template_aliases)
    globalize_symbols(args.object, fixups.get("globalize_symbols", []))
    source_text = (ROOT / args.source).read_text(encoding="utf-8")
    assembly_constants = set(re.findall(
        r"INCLUDE_RODATA\([^,]+,\s*([^)\s]+)\s*\)", source_text))
    export_constants(args.object, fixups.get("rodata_exports", []), parser,
                     assembly_constants, fixups.get("symbols", {}).values())
    if deferred_sections:
        elf = Elf(args.object.read_bytes())
        if rename_sections(elf, deferred_sections, parser):
            parser.error("a numbered constant in `sections` is not exported")
        args.object.write_bytes(elf.pack())


if __name__ == "__main__":
    main()
