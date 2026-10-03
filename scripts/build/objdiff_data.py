#!/usr/bin/env python3
"""Give every unit's objdiff target the data the unit defines.

    objdiff_data.py [--build-dir build/ntsc] [--lcf <linker script>]

objdiff counts a unit's data from its target object alone, and splat's
reference for a unit is its code plus the constants splat migrates into it --
no .data, .sdata, .sbss or .bss, nothing a unit places under a section name of
its own (.vtables, .ctor, an overlay's .tdata), and no unit that has no code.
So the data the source defines was mostly never counted, and the constants that
were could not match: splat sizes a label up to the next one, padding included,
spells a duplicated name with a `__N` suffix, and cuts the image into units by
its own reckoning rather than the linker script's.

This writes, after the link, one target per unit under <build>/objdiff/:

  * the bytes are retail's;
  * they are cut and named the way the source cuts and names them: every datum
    the unit's object defines, at the address the link map says it landed on,
    under the name the object gives it, in a section named as the object's;
  * each datum is as long as retail's own symbol table says. Where retail
    gives no size, the datum runs to retail's next label; the source's size is
    taken only when it fits inside that and what is left is zero fill;
  * a pointer is relocated against whatever retail's word points at, named the
    way the source names that address -- a base relocation that disagrees with
    retail's word becomes a mismatch, not a copy;
  * the unit's code is splat's reference, as before. The constants splat
    migrated into it are kept but no longer allocated, so objdiff neither
    counts them twice nor sees a second copy to pair.

Nothing here is linked: the images and every object the link takes are as they
were.
"""

import argparse
import bisect
import os
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import disassemble  # noqa: E402
import layout  # noqa: E402
import region  # noqa: E402
import retail  # noqa: E402

SHT_PROGBITS, SHT_SYMTAB, SHT_STRTAB, SHT_NOBITS, SHT_REL = 1, 2, 3, 8, 9
SHF_ALLOC, SHF_EXECINSTR = 2, 4
STB_LOCAL, STB_GLOBAL = 0, 1
STT_NOTYPE, STT_SECTION = 0, 3
R_MIPS_32 = 2
SHN_ABS = 0xFFF1
STV_HIDDEN = 2

MAP_LINE = re.compile(r"^  ([0-9A-F]{8}) ([0-9A-F]{8}) (\S+)\s+(.*)\t\((.+)\)$")
IMAGE_HEADER = re.compile(r"^# \.(\w+)$")


class Section:
    def __init__(self, name, sh_type, flags, addralign, data=b"", size=None,
                 link=0, info=0, entsize=0, addr=0):
        self.name = name
        self.type = sh_type
        self.flags = flags
        self.addralign = addralign
        self.data = data
        self.size = len(data) if size is None else size
        self.link = link
        self.info = info
        self.entsize = entsize
        self.addr = addr


class Symbol:
    def __init__(self, name, value, size, bind, sym_type, other, shndx):
        self.name = name
        self.value = value
        self.size = size
        self.bind = bind
        self.type = sym_type
        self.other = other
        self.shndx = shndx


class Object:
    """A relocatable ELF32 little-endian object, read whole."""

    def __init__(self, path):
        raw = Path(path).read_bytes()
        self.header = raw[:0x34]
        shoff, = struct.unpack_from("<I", raw, 0x20)
        shentsize, shnum, shstrndx = struct.unpack_from("<HHH", raw, 0x2E)
        rows = [struct.unpack_from("<10I", raw, shoff + i * shentsize) for i in range(shnum)]
        names = rows[shstrndx]
        self.sections = []
        for (name, sh_type, flags, addr, offset, size, link, info, align, entsize) in rows:
            data = b"" if sh_type == SHT_NOBITS else raw[offset:offset + size]
            self.sections.append(Section(
                _string(raw, names[4] + name), sh_type, flags, align, data, size,
                link, info, entsize, addr))
        self.symbols = []
        self.symtab = next((i for i, s in enumerate(self.sections) if s.type == SHT_SYMTAB), None)
        if self.symtab is not None:
            symtab = self.sections[self.symtab]
            strtab = rows[symtab.link]
            for i in range(symtab.size // 16):
                name, value, size, info, other, shndx = struct.unpack_from(
                    "<IIIBBH", symtab.data, i * 16)
                self.symbols.append(Symbol(_string(raw, strtab[4] + name), value, size,
                                           info >> 4, info & 0xF, other, shndx))
        # {section index: [(offset, type, symbol index)]}
        self.relocations = {}
        for s in self.sections:
            if s.type == SHT_REL:
                self.relocations[s.info] = [
                    (off, info & 0xFF, info >> 8)
                    for off, info in struct.iter_unpack("<II", s.data)]

    def is_microcode(self, index):
        """Whether a section is the vector units' code, which MWCC marks
        executable although the source defines it as words of data."""
        return 0 < index < len(self.sections) and \
            self.sections[index].name in disassemble.VU_SECTIONS and \
            self.sections[index].flags & SHF_EXECINSTR

    def is_data(self, index):
        """Whether a section holds data objdiff counts: allocated, not code."""
        if not 0 < index < len(self.sections):
            return False
        s = self.sections[index]
        return (s.type in (SHT_PROGBITS, SHT_NOBITS) and s.flags & SHF_ALLOC
                and not s.flags & SHF_EXECINSTR)


def _string(raw, offset):
    return raw[offset:raw.index(b"\0", offset)].decode("latin-1")


def read_map(path):
    """{object: {section: [(address, size, name, image)]}} from MWLD's link map.

    The map names an object by its base name, which MWLD requires to be
    unique. Small data and the bss follow a `# Literal` heading, and belong to
    main like everything else past its `.main` heading.
    """
    placed = {}
    image = None
    with open(path, encoding="latin-1") as f:
        for line in f:
            heading = IMAGE_HEADER.match(line.rstrip())
            if heading:
                image = heading.group(1) if heading.group(1) in layout.SECTIONS else None
                continue
            if line.startswith("# Literal"):
                image = "main"
                continue
            if line.startswith("# "):
                image = None
                continue
            m = MAP_LINE.match(line.rstrip("\n"))
            if not m or image is None:
                continue
            address, size, section, name, obj = m.groups()
            placed.setdefault(obj, {}).setdefault(section, []).append(
                (int(address, 16), int(size, 16), name.strip(), image))
    return placed


def place(obj, entries):
    """[(symbol index, address, image)] for the symbols an object defines.

    The map spells most names as the object does, but demangles some -- a
    class's `__vt` or `__RTTI` -- so a symbol it does not name is paired with
    the next unclaimed entry of its section, in address order, if the sizes
    agree.
    """
    out = []
    by_name = {}
    for section, rows in entries.items():
        for row in rows:
            by_name.setdefault((section, row[2]), []).append(row)
    claimed = set()
    pending = []
    order = sorted(
        (i for i, sym in enumerate(obj.symbols)
         if 0 < sym.shndx < len(obj.sections) and sym.type != STT_SECTION and sym.name),
        key=lambda i: (obj.symbols[i].shndx, obj.symbols[i].value))
    for i in order:
        sym = obj.symbols[i]
        section = obj.sections[sym.shndx].name
        rows = [r for r in by_name.get((section, sym.name), ()) if (section, r[0]) not in claimed]
        if rows:
            address, _size, _name, image = rows[0]
            claimed.add((section, address))
            out.append((i, address, image))
        else:
            pending.append(i)
    free = {section: [r for r in rows if (section, r[0]) not in claimed]
            for section, rows in entries.items()}
    for i in pending:
        sym = obj.symbols[i]
        rows = free.get(obj.sections[sym.shndx].name)
        if rows and rows[0][1] == sym.size:
            address, _size, _name, image = rows.pop(0)
            out.append((i, address, image))
    return out


class Retail:
    """Retail's own labels, for how long each datum is."""

    def __init__(self):
        self.labels = {}
        self.sizes = {}
        for image, rows in disassemble.read_symbol_table().items():
            lo, hi = disassemble.image_range(image)
            addresses = set()
            for name, (address, _type, size) in rows.items():
                if lo <= address < hi:
                    self.sizes.setdefault((image, address), {})[name] = size
                    # `_$J1`, `_$table_start`: the VU assembler's labels inside
                    # a microprogram, which end nothing.
                    if not name.startswith("_$"):
                        addresses.add(address)
            self.labels[image] = sorted(addresses)

    def section_end(self, image, address):
        for _name, _kind, start, end in region.SECTIONS[image]:
            if start <= address < end:
                return end
        return address

    def size(self, image, address, name, own_size, nobits):
        """How long retail says the datum at an address is."""
        named = self.sizes.get((image, address), {})
        sized = {n: s for n, s in named.items() if s}
        if sized:
            if name in sized:
                return sized[name]
            if own_size in sized.values():
                return own_size
            return next(iter(sized.values()))
        labels = self.labels.get(image, [])
        i = bisect.bisect_right(labels, address)
        end = self.section_end(image, address)
        if i < len(labels):
            end = min(end, labels[i])
        extent = end - address
        if 0 < own_size <= extent and (
                nobits or not any(retail.read(image, address + own_size, extent - own_size))):
            return own_size
        return extent


def addresses_of(objects, linkmap):
    """({global name: address}, [(address, name)]) over every object the link took."""
    table, every = {}, []
    for path in objects:
        if not os.path.exists(path):
            continue
        obj = Object(path)
        for i, address, _image in place(obj, linkmap.get(os.path.basename(path), {})):
            sym = obj.symbols[i]
            every.append((address, sym.name))
            if sym.bind != STB_LOCAL:
                table.setdefault(sym.name, address)
    return table, sorted(every)


def containing(table_sorted, address):
    """The (start, name) of the symbol at or most recently before an address."""
    i = bisect.bisect_right(table_sorted, (address, "\uffff")) - 1
    return table_sorted[i] if i >= 0 else None


def build_data(base, linkmap_entries, retail_labels, globals_, by_address, stats):
    """The data sections a unit's target holds, cut and named as the source does.

    Returns [(section, [(symbol, offset, size)], [(offset, name, addend)])].
    """
    placed = place(base, linkmap_entries)
    where = {i for i, _address, _image in placed}
    for i, sym in enumerate(base.symbols):
        if sym.size and i not in where and (base.is_data(sym.shndx) or base.is_microcode(sym.shndx)):
            stats["unplaced"] += sym.size
    # The unit's own names first: `@N` and `x$N` are local, and every unit
    # has its own.
    names = dict(globals_)
    names.update((sym.name, sym.value) for sym in base.symbols if sym.shndx == SHN_ABS)
    names.update((base.symbols[i].name, address) for i, address, _image in placed)
    groups = {}
    for i, address, image in placed:
        sym = base.symbols[i]
        if sym.size == 0 or not (base.is_data(sym.shndx) or base.is_microcode(sym.shndx)):
            continue
        groups.setdefault(base.sections[sym.shndx].name, []).append((address, image, i))

    out = []
    for name, members in groups.items():
        members.sort()
        template = next(s for s in base.sections if s.name == name)
        nobits = template.type == SHT_NOBITS
        align = max(s.addralign for s in base.sections if s.name == name) or 1
        start, image = members[0][0], members[0][1]
        rows = []
        end = start
        for address, _image, i in members:
            sym = base.symbols[i]
            size = retail_labels.size(image, address, sym.name, sym.size, nobits)
            if size != sym.size:
                stats["sized apart from the source"] += sym.size
            rows.append((address, size, i))
            end = max(end, address + size)
        data = bytearray(b"" if nobits else retail.read(image, start, end - start))
        relocs = []
        for address, size, i in ([] if nobits else rows):
            sym = base.symbols[i]
            own = base.sections[sym.shndx].data
            for offset, r_type, target in base.relocations.get(sym.shndx, ()):
                if not sym.value <= offset < sym.value + sym.size:
                    continue
                if r_type != R_MIPS_32:
                    stats["relocations of another type"] += 1
                    continue
                at = address + offset - sym.value - start
                if at + 4 > address + size - start:
                    continue
                word, = struct.unpack_from("<I", data, at)
                wanted = base.symbols[target].name
                addend, = struct.unpack_from("<I", own, offset)
                home = names.get(wanted)
                if home is not None and (home + addend) & 0xFFFFFFFF == word:
                    relocs.append((at, wanted, addend))
                else:
                    stats["relocations retail points elsewhere"] += 1
                    hit = containing(by_address, word)
                    if hit is None:
                        continue
                    relocs.append((at, hit[1], word - hit[0]))
                struct.pack_into("<I", data, at, relocs[-1][2])
        symbols = [(base.symbols[i], address - start, size) for address, size, i in rows]
        if template.flags & SHF_EXECINSTR:
            # objdiff would count VU1 microcode as R5900 functions; hidden, it
            # is left out of the code and data totals alike, and stays
            # visible in the diff.
            symbols = [(_hidden(sym), offset, size) for sym, offset, size in symbols]
        out.append((Section(name, template.type, template.flags, align,
                            bytes(data), end - start), symbols, relocs))
    return out


def _hidden(sym):
    return Symbol(sym.name, sym.value, sym.size, sym.bind, sym.type,
                  (sym.other & ~3) | STV_HIDDEN, sym.shndx)


def write(path, header, sections, symbols, relocations):
    """Write a relocatable object.

    `sections` are Section objects (index 0 is added here), `symbols` are
    Symbol objects with `shndx` an index into `sections` + 1, and `relocations`
    is {section index: [(offset, type, symbol index)]}.
    """
    locals_ = [s for s in symbols if s.bind == STB_LOCAL]
    globals_ = [s for s in symbols if s.bind != STB_LOCAL]
    ordered = [Symbol("", 0, 0, 0, 0, 0, 0)] + locals_ + globals_
    remap = {id(s): i for i, s in enumerate(ordered)}

    strtab = bytearray(b"\0")
    string_at = {}

    def string(table, text, cache):
        if text not in cache:
            cache[text] = len(table)
            table += text.encode("latin-1") + b"\0"
        return cache[text]

    sym_data = bytearray()
    for s in ordered:
        sym_data += struct.pack("<IIIBBH", string(strtab, s.name, string_at) if s.name else 0,
                                s.value, s.size, (s.bind << 4) | s.type, s.other, s.shndx)

    all_sections = [Section("", 0, 0, 0)] + list(sections)
    symtab_index = len(all_sections) + len(relocations)
    for index, rows in sorted(relocations.items()):
        target = all_sections[index]
        body = b"".join(struct.pack("<II", off, (remap[id(sym)] << 8) | r_type)
                        for off, r_type, sym in rows)
        all_sections.append(Section(".rel" + target.name, SHT_REL, 0, 4, body,
                                    link=symtab_index, info=index, entsize=8))
    all_sections.append(Section(".symtab", SHT_SYMTAB, 0, 4, bytes(sym_data),
                                link=symtab_index + 1, info=1 + len(locals_), entsize=16))
    all_sections.append(Section(".strtab", SHT_STRTAB, 0, 1, bytes(strtab)))
    shstrtab = bytearray(b"\0")
    names = {}
    name_offsets = [string(shstrtab, s.name, names) if s.name else 0 for s in all_sections]
    name_offsets.append(string(shstrtab, ".shstrtab", names))
    all_sections.append(Section(".shstrtab", SHT_STRTAB, 0, 1, bytes(shstrtab)))

    body = bytearray(header)
    offsets = []
    for s in all_sections:
        align = max(s.addralign, 1)
        if s.type != SHT_NOBITS:
            body += b"\0" * (-len(body) % align)
        offsets.append(len(body) if s.name else 0)
        if s.type != SHT_NOBITS:
            body += s.data
    body += b"\0" * (-len(body) % 4)
    shoff = len(body)
    for s, offset, name in zip(all_sections, offsets, name_offsets):
        body += struct.pack("<10I", name, s.type, s.flags, s.addr, offset, s.size,
                            s.link, s.info, s.addralign, s.entsize)
    struct.pack_into("<I", body, 0x20, shoff)
    struct.pack_into("<HHH", body, 0x2E, 40, len(all_sections), len(all_sections) - 1)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    if not os.path.exists(path) or Path(path).read_bytes() != bytes(body):
        Path(path).write_bytes(bytes(body))


def merge(out, code_path, base, data):
    """The unit's code reference, with its data replaced by `data`."""
    if code_path:
        code = Object(code_path)
        header = code.header
        sections = [s for s in code.sections[1:]
                    if s.type not in (SHT_SYMTAB, SHT_STRTAB, SHT_REL)]
        index = {id(s): i + 1 for i, s in enumerate(sections)}
        old_index = {i: index.get(id(s)) for i, s in enumerate(code.sections)}
        for s in sections:
            if s.type in (SHT_PROGBITS, SHT_NOBITS) and s.flags & SHF_ALLOC \
                    and not s.flags & SHF_EXECINSTR:
                s.flags &= ~SHF_ALLOC
        symbols = []
        for sym in code.symbols[1:]:
            shndx = sym.shndx
            if 0 < shndx < 0xFF00:
                shndx = old_index.get(shndx) or 0
            symbols.append(Symbol(sym.name, sym.value, sym.size, sym.bind, sym.type,
                                  sym.other, shndx))
        relocations = {}
        for target, rows in code.relocations.items():
            if old_index.get(target):
                relocations[old_index[target]] = [
                    (off, r_type, symbols[sym - 1]) for off, r_type, sym in rows if sym]
    else:
        header = base.header
        sections, symbols, relocations = [], [], {}

    defined, undefined = {}, {}
    placed = []
    for section, members, relocs in data:
        sections.append(section)
        placed.append((len(sections), relocs))
        for sym, value, size in members:
            symbols.append(Symbol(sym.name, value, size, sym.bind, sym.type, sym.other,
                                  len(sections)))
            defined.setdefault(sym.name, symbols[-1])
    for here, relocs in placed:
        rows = []
        for offset, name, _addend in relocs:
            target = defined.get(name) or undefined.get(name)
            if target is None:
                target = undefined[name] = Symbol(name, 0, 0, STB_GLOBAL, STT_NOTYPE, 0, 0)
                symbols.append(target)
            rows.append((offset, R_MIPS_32, target))
        if rows:
            relocations[here] = rows
    write(out, header, sections, symbols, relocations)


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--build-dir", default=region.BUILD)
    ap.add_argument("--lcf", default=layout.LCF)
    ap.add_argument("--stamp", help="touch this once every target is written")
    args = ap.parse_args()

    build = args.build_dir
    linkmap = read_map(f"{build}/SCUS_971.11.xMAP")
    linked = []
    for image in layout.SECTIONS:
        path = f"{build}/{image}_o_files"
        if os.path.exists(path):
            linked += open(path).read().split()
    globals_, by_address = addresses_of(linked, linkmap)
    labels = Retail()

    written = 0
    stats = dict.fromkeys(("unplaced", "sized apart from the source",
                           "relocations retail points elsewhere",
                           "relocations of another type"), 0)
    for source, code, base in layout.objdiff_data_units(args.lcf, build):
        base_obj = Object(base)
        data = build_data(base_obj, linkmap.get(os.path.basename(source) + ".o", {}),
                          labels, globals_, by_address, stats)
        merge(layout.objdiff_target(build, source), code, base_obj, data)
        written += 1
    print(f"objdiff_data: {written} targets with their data -> {build}/objdiff/")
    remarks = ", ".join(f"{key} {value}" for key, value in stats.items() if value)
    if remarks:
        print(f"objdiff_data: {remarks}")
    if args.stamp:
        Path(args.stamp).parent.mkdir(parents=True, exist_ok=True)
        Path(args.stamp).write_text(f"{written}\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
