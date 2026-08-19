#!/usr/bin/env python3
"""Work out what the link takes, in what order, and what objdiff compares.

    layout.py --link-order <dir> [--build-dir build] [--main-tail obj...]
    layout.py --objdiff objdiff.json
    layout.py --provenance <file>
    layout.py --list-extra-objects

The linker script says where each translation unit starts: every object it names
carries the retail address of its first byte in the comment beside it. The link
order is those units in address order, a unit owns everything from its start to
the next one's, and nothing here reads a compiled object.

Placement deliberately does not come from the INCLUDE_ASM markers. A marker
says a function is not decompiled yet, which is a fact about progress, not
about where code lives -- deriving position from it would move a unit as its
last marker was retired. The markers are read for one thing only: a function
one of them names has no decompiled base for objdiff to compare against.
"""

import argparse
import json
import os
import re
import sys
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
# verify.py owns what a source declares about a function; objdiff needs the
# fuzzy declarations to categorise a unit.
import verify  # noqa: E402
# disassemble.py owns the section layout, the unit classification and retail's
# symbol table.
import disassemble  # noqa: E402

SECTIONS = ("main", "title", "dun")

SRC_DIR = "src"
# Where splat files a function's own assembly: still supplied by a marker
# under the first, decompiled under the second.
ASM_DIRS = ("asm/nonmatchings", "asm/matchings")
LCF = "SCUS_971.11.lcf"

# A marker names the directory its reference assembly is in and the symbol it
# stands for. Only the symbol is read: retail's names are unique across the
# three images, so nothing else is needed to tell two apart.
MARKER = re.compile(
    r'^INCLUDE_(ASM|RODATA)\s*\(\s*"[^"]*"\s*,\s*([^)\s]+)\s*\)', re.M
)

# A unit's placement in the linker script: the object, the section it is placed
# by, and the retail address it starts at. Which image it belongs to is the
# section -- the overlays' objects carry privately-prefixed names.
PLACEMENT = re.compile(
    r"^\s*(\S+)\.o\s*\(\s*(\.[td]?text)\s*\)\s*//\s*(0x[0-9a-fA-F]+)\s*$", re.M
)
IMAGE_OF = {".text": "main", ".ttext": "title", ".dtext": "dun"}

# objdiff runs `<custom_make> <custom_args...> <object path>` to rebuild. The
# path is meaningless here -- this project builds in one step -- so the trailing
# argument is swallowed by handing it to `sh -c` as $0.
OBJDIFF = {
    "min_version": "2.0.0-beta.5",
    "custom_make": "sh",
    "custom_args": ["-c", "exec scripts/build/build_objdiff.sh"],
    "build_target": False,
    "build_base": True,
    "watch_patterns": [
        "src/**/*.{c,cpp,h,hpp,s,inc,lcf}",
        "include/**/*.{h,hpp,s,inc,lcf}",
        "asm/**/*.s",
        "config/*.{yaml,txt}",
    ],
    # What each function is expected to be, so objdiff can show the three
    # apart. A perfect function's bytes are retail's; a fuzzy one is the same
    # instructions in the same order with different registers, and says so with
    # FUZZY_MATCH; an undecompiled one is still supplied by INCLUDE_ASM.
    "progress_categories": [
        {"id": "game", "name": "Game"},
        {"id": "title", "name": "TITLE overlay"},
        {"id": "dun", "name": "DUN overlay"},
        {"id": "libc", "name": "libc"},
        {"id": "libm", "name": "libm"},
        {"id": "libgcc", "name": "libgcc"},
        {"id": "sce", "name": "SCE SDK"},
    ],
    # MWCC mangles C++ the way GCC did before 3.0 -- `__ct__7CCameraFf` -- so
    # objdiff can read those names back if it is told which scheme to use.
    "options": {"demangler": "gnu_legacy"},
}


# Which library a unit belongs to, from where its source sits. Everything the
# game itself is made of falls through to `game`; the overlays are called out
# because they are separate images.
LIBRARIES = (
    ("src/lib/libc/", "libc"),
    ("src/lib/libm/", "libm"),
    ("src/lib/libgcc/", "libgcc"),
    ("src/lib/", "sce"),
    ("src/title/", "title"),
    ("src/dun/", "dun"),
)


def category_of(source):
    """The progress category a unit is counted under."""
    for prefix, name in LIBRARIES:
        if source.startswith(prefix):
            return name
    return "game"


def included_in_objdiff(source):
    """Return whether objdiff should expose this translation unit."""
    return not source.startswith("src/lib/") or source == "src/lib/crt0.c"


# Which image an address belongs to. The overlays share a range with each
# other but not with main, and only one of them is ever loaded at a time.
IMAGE_RANGES = (
    ("main", 0x00100000, 0x01DABD00),
    ("title", 0x01DABD00, 0x01E5DF80),
)

ADDRESS_COMMENT = re.compile(r"^\s*/\* [0-9A-F]+ ([0-9A-F]{8}) ")


def first_address(path):
    """The retail address a reference file starts at, from its own comments."""
    with open(path, encoding="utf-8", errors="replace") as f:
        for line in f:
            m = ADDRESS_COMMENT.match(line)
            if m:
                return int(m.group(1), 16)
    return None


def read_reference(code=(), placed=()):
    """(functions, dumps) for every image.

    `functions` is one row per per-function reference file, `dumps` one per
    whole-section dump the link can take. Both come from the splat
    configuration: retail's symbol table says what exists and where, and splat
    files each function under the translation unit it belongs to.

    A function in a unit that is taken whole has no file of its own; its
    reference is the unit's single assembly file, which is what objdiff
    compares it against and all the link ever needs.

    `code` names the symbols an INCLUDE_ASM marker supplies. Retail types most
    of them FUNC, but not the padding a segment starts with -- `_dun_text_start`
    is a NOTYPE that a marker supplies all the same -- so a marked symbol counts
    as code whatever its type says.
    """
    functions = {s: [] for s in SECTIONS}
    dumps = {s: [] for s in SECTIONS}

    paths = {}
    for directory in ASM_DIRS:
        root = Path(directory)
        if root.is_dir():
            for path in root.rglob("*.s"):
                paths.setdefault(path.stem, path.as_posix())

    # Where a whole-file unit's functions are to be found, by address. Only
    # those fall back: a unit that is compiled has a file per function, and
    # pointing one at the whole unit would compare it against its neighbours
    # as well.
    reference = unit_references()
    kinds = {source: kind for kind, _image, source, _ref
             in disassemble.read_units()}
    spans = {
        image: owners(placed, image) for image in SECTIONS
    } if placed else {}

    def file_for(image, name, vram):
        if name in paths:
            return paths[name]
        source = owner_of(spans.get(image, []), vram)
        if source is None:
            return None
        if kinds.get(source) != "asm":
            return None
        return reference.get(source)

    table = disassemble.read_symbol_table()
    seen = set()
    for image in SECTIONS:
        # main's list carries the overlays' symbols too, so that its code can
        # name what it calls into. Those belong to the overlay, not to main.
        lo, hi = disassemble.image_range(image)
        for name, (vram, sym_type, size) in table.get(image, {}).items():
            if not lo <= vram < hi:
                continue
            if sym_type == "func" or name in code:
                path = file_for(image, name, vram)
                if path is not None:
                    functions[image].append((vram, name, size, path))
                    seen.add(name)

    # A function retail's symbol table does not name -- spimdisasm calls it
    # func_<address> -- has a marker and a file but no table entry, so its
    # address is read off the file itself.
    for name in sorted(code - seen):
        path = paths.get(name)
        if path is None:
            continue
        vram = first_address(path)
        if vram is None:
            continue
        for image, lo, hi in IMAGE_RANGES:
            if lo <= vram < hi:
                functions[image].append((vram, name, 0, path))
                break

    for image in SECTIONS:
        functions[image].sort()

    for image, name, start, _end in disassemble.dump_spans():
        dumps[image].append((start, name, disassemble.dump_path(name)))
        dumps[image].sort()

    return functions, dumps


def unit_references():
    """{source: the assembly splat writes for that unit}.

    Every unit has one, whether or not the link uses it: a unit with nothing
    decompiled is assembled from it, and one that is compiled is compared
    against it.
    """
    return {
        source: reference
        for _kind, _image, source, reference in disassemble.read_units()
    }


def read_sources(src_dir=SRC_DIR):
    """Return markers and synthetic identities for all translation units."""
    out = {}
    for root, _dirs, files in os.walk(src_dir):
        for name in sorted(files):
            if not name.endswith((".c", ".cpp")):
                continue
            # tools/mwccgap writes its second compile to a temporary beside the
            # source it came from, and that file is gone again a moment later.
            if name.startswith("tmp"):
                continue
            path = os.path.join(root, name)
            try:
                text = open(path, encoding="utf-8", errors="replace").read()
            except OSError:
                continue
            out[path] = MARKER.findall(text)
    # Whole-assembly library units have no placeholder source. Keep their
    # synthetic source identities so linker-script object names still map to
    # the units derived from the split configuration.
    for _kind, _image, source, _reference in disassemble.read_units():
        out.setdefault(source, [])
    return out


def read_units(sources, path=LCF):
    """[(address, image, source)] for every translation unit, in link order.

    The linker script names objects; `sources` maps each back to the file it is
    built from, which is what the rest of this works in.
    """
    by_object = {}
    for source in sources:
        by_object.setdefault(os.path.basename(source), []).append(source)

    out, missing, ambiguous = [], [], []
    for name, section, address in PLACEMENT.findall(open(path).read()):
        candidates = by_object.get(name, [])
        if not candidates:
            missing.append(name)
        elif len(candidates) > 1:
            ambiguous.append(f'{name} ({", ".join(candidates)})')
        else:
            out.append((int(address, 16), IMAGE_OF[section], candidates[0]))

    for name in missing:
        print(
            f"  ERROR: {path} places {name}.o, which no source under "
            f"{SRC_DIR}/ builds",
            file=sys.stderr,
        )
    # mwld identifies an object by base name alone and segfaults without a
    # diagnostic when two collide, so this cannot be allowed through either.
    for name in ambiguous:
        print(f"  ERROR: {name} is built from more than one source", file=sys.stderr)
    if missing or ambiguous:
        raise SystemExit(1)

    out.sort()
    return out


def owners(placed, section):
    """[(start, end, source)] for one image, covering it end to end."""
    spans = [(a, s) for a, img, s in placed if img == section]
    return [
        (a, spans[i + 1][0] if i + 1 < len(spans) else None, s)
        for i, (a, s) in enumerate(spans)
    ]


def owner_of(spans, address):
    for start, end, source in spans:
        if start <= address and (end is None or address < end):
            return source
    return None


def check(placed, functions, marked):
    """Complain if a marker sits in a unit that does not cover it.

    mwcc emits a unit's functions as one contiguous .text, so a marker in the
    wrong file moves everything after it. This is the one thing that has to
    hold for the link to reproduce retail.
    """
    problems = []
    for section in SECTIONS:
        spans = owners(placed, section)
        for address, symbol, _size, _src in functions[section]:
            source = marked.get(symbol)
            if source and owner_of(spans, address) != source:
                problems.append(
                    f"{symbol} at {address:#010x} is marked in {source}, but that "
                    f"address belongs to {owner_of(spans, address)}"
                )
    return problems


def link_order(args, placed, dumps, carved):
    """One mwld response file per image, in retail address order.

    A unit with nothing decompiled in it is taken whole: splat writes its code
    and its constants to a single assembly file and the link takes that object.
    A unit with any decompiled function is compiled instead, and tools/mwccgap
    splices the rest back in around what the compiler produced.

    A whole-section dump is excluded when the migration carves it: the carved
    parts replace it and --main-tail supplies them.
    """
    for section in SECTIONS:
        # Every unit's object is named after its source, whether it was
        # compiled or assembled from the unit's reference; see
        # add_unit_asm_object in cmake/ObjectLists.cmake.
        items = [
            (a, f"{args.build_dir}/{s}.o") for a, img, s in placed if img == section
        ]
        items += [
            (a, f"{args.build_dir}/{src}.o")
            for a, name, src in dumps[section]
            if name not in carved
        ]
        items.sort()

        out, seen = [], set()
        for _a, obj in items:
            if obj not in seen:
                seen.add(obj)
                out.append(obj)
        if section == "main":
            out += args.main_tail

        with open(os.path.join(args.link_order, f"{section}_o_files"), "w") as f:
            f.write(" ".join(out) + "\n")
    return sum(1 for _ in placed)


def provenance(path, placed, functions, marked, build_dir):
    """Where each function comes from, for reading rather than for the build."""
    rows = []
    kinds = {source: kind for kind, _image, source, _ref
             in disassemble.read_units()}
    for section in SECTIONS:
        spans = owners(placed, section)
        for address, symbol, _size, _src in functions[section]:
            source = owner_of(spans, address)
            kind = (
                "asm"
                if kinds.get(source) == "asm" or marked.get(symbol)
                else "cpp"
            )
            rows.append((address, kind, f"{build_dir}/{source}.o", symbol))
    rows.sort()
    with open(path, "w") as f:
        f.write("# Where each function in the build comes from.\n")
        f.write("# Generated by scripts/build/layout.py; do not edit.\n")
        f.write("#\n# address\tprovider\tsource\tsymbol\n")
        for address, kind, source, symbol in rows:
            f.write(f"{address:#010x}\t{kind}\t{source}\t{symbol}\n")
    return sum(1 for r in rows if r[1] == "cpp"), sum(1 for r in rows if r[1] == "asm")


def objdiff(path, placed, functions, marked, build_dir, declared):
    """objdiff.json: one unit per translation unit.

    The target is the assembly splat writes for the whole unit -- code and
    constants together, the same shape the compiler produces from the source --
    and the base is the object the build links. Pairing them that way is what
    lets a function be opened and diffed on its own.

    Progress stays honest because the functions a marker still supplies are
    declared hidden in the target, and objdiff leaves a hidden symbol out of
    its totals. A unit with nothing decompiled in it is given no base at all,
    so it scores zero.
    """
    kinds = {source: kind for kind, _image, source, _ref
             in disassemble.read_units()}
    reference = unit_references()

    unit_list, decompiled, fuzzy_units = [], 0, 0
    for address, image, source in placed:
        if not included_in_objdiff(source):
            continue
        # Named after the source, so the sidebar groups a unit under the
        # library it came from.
        name = os.path.splitext(os.path.relpath(source, SRC_DIR))[0]
        unit = {"name": name.replace(os.sep, "/")}

        if not os.path.exists(reference[source]):
            # No code in this unit at all -- mainselect.cpp and userstatus.cpp
            # supply data and nothing else -- so there is nothing to compare.
            continue

        unit["target_path"] = f"{build_dir}/{reference[source]}.o"
        # The source compiled on its own, not the object the link takes: that
        # one has retail's instructions spliced into every marker and would
        # match whether the function was written or not.
        #
        # Only where there is a source to compile. A unit with nothing
        # decompiled in it is markers and nothing else, so its base would be an
        # empty object -- which scores the same zero as having no base, at the
        # cost of a compile per unit and a pairing that claims a comparison
        # nobody has written the other half of yet.
        if kinds.get(source) != "asm":
            unit["base_path"] = f"{build_dir}/diff/{source}.o"

        here = [
            symbol
            for _a, symbol, _s, _p in functions[image]
            if owner_of(owners(placed, image), _a) == source
        ]
        # `complete` says the unit is finished, and objdiff takes it at its
        # word -- so it is only set when nothing in the unit is still supplied
        # by a marker. Anything less and the whole unit would count as matched.
        finished = bool(here) and not any(marked.get(symbol) for symbol in here)

        unit["metadata"] = {
            "complete": finished,
            "progress_categories": [category_of(source)],
            "source_path": source,
        }
        if kinds.get(source) != "asm":
            decompiled += 1
            if any(symbol in declared for symbol in here):
                fuzzy_units += 1

        unit_list.append(unit)

    config = dict(OBJDIFF, name="dcdecomp", units=unit_list)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(config, f, indent=2)
        f.write("\n")
    return len(unit_list), decompiled, fuzzy_units


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--link-order", help="write <image>_o_files here")
    ap.add_argument("--objdiff", help="write the objdiff unit list here")
    ap.add_argument("--provenance", help="write the symbol provenance here")
    ap.add_argument("--build-dir", default="build")
    ap.add_argument(
        "--lcf",
        default=LCF,
        help="the linker script to read the " "unit placement from",
    )
    ap.add_argument(
        "--main-tail",
        nargs="*",
        default=[],
        help="objects appended to main after the address-ordered ones",
    )
    ap.add_argument(
        "--list-extra-objects",
        action="store_true",
        help="print the dumps objdiff needs as targets",
    )
    ap.add_argument(
        "--carved", nargs="*", default=[], help="section dumps the migration replaces"
    )
    args = ap.parse_args()

    # The markers are read first: which symbols are code, and so which
    # reference files are a function rather than a constant, comes from them.
    sources = read_sources()
    placed = read_units(sources, args.lcf)
    functions, dumps = read_reference(
        {symbol for markers in sources.values() for kind, symbol in markers
         if kind == "ASM"},
        placed,
    )

    if args.list_extra_objects:
        # What objdiff needs as a target and the link does not already build:
        # the per-function assembly of every compiled unit, which tools/mwccgap
        # reads rather than assembles. A unit taken whole is assembled from its
        # own file into the object the link takes, so it needs nothing extra.
        # Every unit's whole-unit assembly, which is what objdiff compares
        # against. None of these objects is linked -- a unit taken whole is
        # assembled separately into the object the link takes -- so the
        # undecompiled functions can be hidden in them without the link
        # losing sight of those symbols.
        print("\n".join(sorted(
            reference
            for source, reference in unit_references().items()
            if included_in_objdiff(source) and os.path.exists(reference)
        )))
        return 0

    marked = {}
    for source, markers in sources.items():
        for _kind, symbol in markers:
            marked[symbol] = source

    problems = check(placed, functions, marked)
    for message in problems:
        print(f"  ERROR: {message}", file=sys.stderr)
    if problems:
        print(
            f"layout: {len(problems)} problem(s); the link would not reproduce "
            f"retail",
            file=sys.stderr,
        )
        return 1

    if args.link_order:
        n = link_order(args, placed, dumps, set(args.carved))
        print(
            f"layout: {n} translation units in address order -> "
            f"{args.link_order}/<image>_o_files"
        )
    if args.provenance:
        cpp, asm = provenance(
            args.provenance, placed, functions, marked, args.build_dir
        )
        print(f"layout: {cpp} functions from cpp, {asm} from asm -> {args.provenance}")
    if args.objdiff:
        total, done, fz = objdiff(
            args.objdiff,
            placed,
            functions,
            marked,
            args.build_dir,
            verify.declarations(),
        )
        print(
            f"layout: {total} objdiff units, {done} with a decompiled base "
            f"({fz} declared fuzzy) -> {args.objdiff}"
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
