#!/usr/bin/env python3
"""Lay a unit's data out the way MWLD will and compare it with retail's addresses.

    datacheck.py <unit>            e.g. datacheck.py shop      (src/shop.cpp)
    datacheck.py <unit> --build    rebuild build/src/<unit>.cpp.o first (takes .build.lock)
    datacheck.py <unit> --init     also disassemble the object's .init beside retail's __sinit
    datacheck.py <unit> --bytes    also compare .data/.sdata contents word by word with the dump

For every data section kind the object emits (.data, .sdata, .sbss, .bss, .init,
.ctor and any renamed run such as .shopdata-*) the object's sections are laid
end to end in object order, each on its own alignment, which is what MWLD does
under ALIGNALL(1). The run is anchored on the first symbol whose retail address
is known, and every named symbol's predicted address is compared with retail's.
Compiler-invented `@N` names cannot be matched by name; the retail label that
stands at the predicted address is printed beside them instead, so a template
that lands on retail's template of the same size reads as agreement.

What it cannot see: whether the linker script places the run where it starts.
That is the gate's job (`scripts/build/cmake.sh all`, then verify.py).
"""

from __future__ import annotations

import argparse
import bisect
import re
import struct
import subprocess
import sys
import tempfile
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
READELF = "mips-ps2-decompals-readelf"
OBJDUMP = "mips-ps2-decompals-objdump"
SYMBOL = re.compile(r"^(\S+)\s*=\s*0x([0-9a-fA-F]+);\s*//\s*(.*)$")
SKIP = (".text", ".rodata", ".rodata.gap", ".mwcats", ".comment", ".exception",
        ".exceptix", ".rel", ".rela", ".vtables", ".vt-", ".discard", ".lit4", ".lit8",
        ".symtab", ".strtab", ".shstrtab", ".mdebug", ".reginfo", ".MIPS", ".note",
        ".gnu", ".debug", ".pdr")


def retail_symbols():
    """{name: (address, size)} and {address: name}, from every image's list."""
    by_name, by_addr = {}, {}
    for path in sorted(ROOT.glob("config/*.symbols.txt")):
        for line in path.read_text(encoding="utf-8").splitlines():
            m = SYMBOL.match(line.strip())
            if not m:
                continue
            name, addr, rest = m.group(1), int(m.group(2), 16), m.group(3)
            size = re.search(r"size:(0x[0-9a-fA-F]+)", rest)
            by_name.setdefault(name, (addr, int(size.group(1), 16) if size else None))
            by_addr.setdefault(addr, name)
    return by_name, by_addr


def dump_words():
    """{address: (word, text)} and {address: label} from the whole-section dumps."""
    words, labels = {}, {}
    for path in list(ROOT.glob("asm/data/*/parts/*.s")) + list(ROOT.glob("asm/data/*/*.s")):
        cur = None
        for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
            m = re.match(r'^(?:glabel|dlabel)\s+"?([^"\n]+?)"?\s*$', line)
            if m:
                cur = m.group(1)
                continue
            m = re.match(r"\s*/\* (?:[0-9A-F]+ )?([0-9A-F]{8})(?: ([0-9A-F]{8}))?\s*\*/\s*(.*)$", line)
            if m:
                a = int(m.group(1), 16)
                if cur:
                    labels.setdefault(a, cur)
                    cur = None
                if m.group(2):
                    words.setdefault(a, (int.from_bytes(bytes.fromhex(m.group(2)), "little"), m.group(3)))
    return words, labels


def object_sections(obj):
    """[[index, name, size, align, [(offset, size, name)]]] in section order."""
    out = subprocess.run([READELF, "-S", "-s", "-W", str(obj)], check=True,
                         capture_output=True, text=True).stdout
    sections = {}
    order = []
    for m in re.finditer(r"^\s*\[\s*(\d+)\]\s+(\S+)\s+(\S+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+\S+\s+(\S*)\s+\d+\s+\d+\s+(\d+)", out, re.M):
        idx = int(m.group(1))
        sections[idx] = [idx, m.group(2), int(m.group(6), 16), max(1, int(m.group(8))), []]
        order.append(idx)
    for m in re.finditer(r"^\s*\d+:\s+([0-9a-f]+)\s+(\d+)\s+(\w+)\s+(\w+)\s+\w+\s+(\d+)\s+(\S+)$", out, re.M):
        value, size, typ, bind, ndx, name = m.groups()
        if typ == "SECTION" or typ == "FILE":
            continue
        idx = int(ndx)
        if idx in sections:
            sections[idx][4].append((int(value, 16), int(size), name))
    return [sections[i] for i in order]


def disassemble_words(words_le, base):
    """objdump -D on raw little-endian words, as (address, text) lines."""
    with tempfile.NamedTemporaryFile(suffix=".bin", delete=False) as f:
        f.write(b"".join(struct.pack("<I", w) for w in words_le))
        path = f.name
    out = subprocess.run([OBJDUMP, "-D", "-b", "binary", "-m", "mips:5900", "-EL",
                          f"--adjust-vma={base:#x}", path], capture_output=True, text=True).stdout
    Path(path).unlink()
    return [l for l in out.splitlines() if re.match(r"^\s*[0-9a-f]+:", l)]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("unit", help="unit name, e.g. shop or dun/gameloop")
    ap.add_argument("--build", action="store_true")
    ap.add_argument("--init", action="store_true")
    ap.add_argument("--bytes", action="store_true")
    args = ap.parse_args()
    obj = ROOT / "build" / "src" / f"{args.unit}.cpp.o"
    if args.build:
        subprocess.run(["flock", ".build.lock", "ninja", "-C", "build", f"src/{args.unit}.cpp.o"],
                       cwd=ROOT, check=True)
    if not obj.exists():
        sys.exit(f"{obj} does not exist; pass --build")
    by_name, by_addr = retail_symbols()
    words, labels = dump_words()
    addrs = sorted(set(by_addr) | set(labels))

    def label_at(a):
        if a in by_addr:
            return by_addr[a]
        if a in labels:
            return labels[a]
        i = bisect.bisect_right(addrs, a) - 1
        if i >= 0:
            n = by_addr.get(addrs[i]) or labels.get(addrs[i])
            return f"{n}+0x{a - addrs[i]:X}"
        return "?"

    kinds = defaultdict(list)
    for s in object_sections(obj):
        if s[2] == 0 or any(s[1].startswith(k) for k in SKIP) or s[1] in ("", "NULL"):
            continue
        kinds[s[1]].append(s)
    bad = 0
    for kind, secs in kinds.items():
        def layout(base):
            """Lay the sections end to end from `base`, aligning absolute addresses."""
            off = base
            rows = []
            for idx, name, size, align, syms in secs:
                off = (off + align - 1) & ~(align - 1)
                named = [(value, ssize, sname) for value, ssize, sname in sorted(syms) if sname]
                for value, ssize, sname in named:
                    rows.append((off + value - base, ssize or size, sname, align))
                if not named:
                    rows.append((off - base, size, f"<unnamed {name} #{idx}>", align))
                off += size
            return rows, off - base
        rows, off = layout(0)
        anchor = None
        for o, ssize, sname, _al in rows:
            if sname in by_name and not sname.startswith("@"):
                anchor = by_name[sname][0] - o
                break
        if anchor is not None:
            # a section aligned beyond the run's start lands where the absolute address says
            rows, off = layout(anchor)
            for o, ssize, sname, _al in rows:
                if sname in by_name and not sname.startswith("@"):
                    anchor = by_name[sname][0] - o
                    break
            rows, off = layout(anchor)
        print(f"\n== {kind}: {len(secs)} section(s), 0x{off:X} bytes, "
              + (f"anchored at 0x{anchor:08X}" if anchor is not None else "no retail name to anchor on"))
        for o, ssize, sname, align in rows:
            pred = anchor + o if anchor is not None else None
            retail = None if sname.startswith("@") else by_name.get(sname)
            if retail and pred is not None:
                ok = "ok " if retail[0] == pred else "BAD"
                if ok == "BAD":
                    bad += 1
                extra = "" if retail[0] == pred else f"  retail 0x{retail[0]:08X} ({retail[0] - pred:+#x})"
                sz = "" if retail[1] in (None, ssize) else f"  size retail 0x{retail[1]:X} ours 0x{ssize:X}"
                print(f"  {ok} {pred:08X} +0x{ssize:<5X} {sname}{extra}{sz}")
            elif pred is not None:
                print(f"  ?   {pred:08X} +0x{ssize:<5X} {sname:40} retail has: {label_at(pred)}")
            else:
                print(f"      +0x{o:<6X} +0x{ssize:<5X} {sname}  (align {align})")
        if anchor is not None:
            print(f"  end {anchor + off:08X}  (next retail label: {label_at(anchor + off)})")
    if args.init:
        for idx, name, size, align, syms in kinds.get(".init", []):
            fn = next((n for _v, _s, n in syms if n.startswith("__sinit")), None)
            print(f"\n== .init #{idx} ours: {fn} ({size:#x} bytes)")
            out = subprocess.run([OBJDUMP, "-d", "-r", "-j", name, str(obj)], capture_output=True, text=True).stdout
            ours = [l for l in out.splitlines() if re.match(r"^\s*[0-9a-f]+:", l)]
            retail = by_name.get(fn) if fn else None
            if retail is None:
                # the retail name differs when a unit was renamed; take the candidate from the source's fixup
                print("  (no retail __sinit of that name; pass the unit under its retail name or compare by hand)")
                print("\n".join(ours))
                continue
            raddr, rsize = retail
            rwords = [words.get(raddr + 4 * i, (0, "?"))[0] for i in range((rsize or size) // 4)]
            theirs = disassemble_words(rwords, raddr)
            print(f"   retail {fn} @ {raddr:08X} ({rsize:#x} bytes){'' if rsize == size else '  ** SIZE DIFFERS **'}")
            width = max((len(l) for l in ours), default=40) + 2
            for i in range(max(len(ours), len(theirs))):
                a = ours[i] if i < len(ours) else ""
                b = theirs[i] if i < len(theirs) else ""
                print(f"  {a:<{width}} | {b}")
    if args.bytes:
        bad += compare_bytes(obj, kinds, by_name, words)
    print(f"\n{bad} mismatch(es)")
    return 1 if bad else 0


def section_bytes(obj, index):
    """The raw bytes of one section, from readelf -x."""
    out = subprocess.run([READELF, "-x", str(index), "-W", str(obj)], capture_output=True, text=True).stdout
    data = bytearray()
    for line in out.splitlines():
        m = re.match(r"\s*0x[0-9a-f]{8}\s+((?:[0-9a-f]{2,8}\s+)+)", line)
        if m:
            for chunk in m.group(1).split():
                data += bytes.fromhex(chunk)
    return bytes(data)


def relocations(obj):
    """{section index: {offset: (type, symbol)}} from readelf -r."""
    out = subprocess.run([READELF, "-r", "-W", str(obj)], capture_output=True, text=True).stdout
    by_section = {}
    # readelf names the target by the reloc section: '.rel.data' etc.; map by order against -S
    secs = subprocess.run([READELF, "-S", "-W", str(obj)], capture_output=True, text=True).stdout
    info = {}
    for m in re.finditer(r"^\s*\[\s*(\d+)\]\s+(\S+)\s+REL\s+\S+\s+\S+\s+\S+\s+\S+\s+\S*\s+\d+\s+(\d+)", secs, re.M):
        info[m.group(2) + "@" + m.group(1)] = int(m.group(3))
    current = None
    names = list(info)
    pos = 0
    for line in out.splitlines():
        m = re.match(r"Relocation section '(\S+)' at offset 0x([0-9a-f]+)", line)
        if m:
            # the sections come in the same order as in -S
            key = names[pos] if pos < len(names) else None
            pos += 1
            current = info.get(key) if key else None
            if current is not None:
                by_section.setdefault(current, {})
            continue
        m = re.match(r"^([0-9a-f]{8})\s+[0-9a-f]+\s+(R_MIPS_\w+)\s+[0-9a-f]*\s*(\S+)", line)
        if m and current is not None:
            by_section[current][int(m.group(1), 16)] = (m.group(2), m.group(3))
    return by_section


def compare_bytes(obj, kinds, by_name, words):
    """Compare each .data/.sdata-like section's words with retail's, resolving R_MIPS_32 by symbol."""
    relocs = relocations(obj)
    bad = 0
    for kind, secs in kinds.items():
        if kind in (".sbss", ".bss", ".ctor", ".init") or "bss" in kind:
            continue
        def lay(base):
            off = base; out = []
            for idx, name, size, align, syms in secs:
                off = (off + align - 1) & ~(align - 1)
                out.append((idx, off - base, size, syms))
                off += size
            return out
        laid = lay(0)
        anchor = None
        for idx, soff, size, syms in laid:
            for value, _s, sname in syms:
                if sname in by_name and not sname.startswith("@"):
                    anchor = by_name[sname][0] - (soff + value)
                    break
            if anchor is not None:
                break
        if anchor is not None:
            # absolute alignment: a 64-aligned section lands where the address says
            for _ in range(2):
                laid = lay(anchor)
                for idx, soff, size, syms in laid:
                    hit = next((by_name[n][0] - (soff + v) for v, _s, n in syms if n in by_name and not n.startswith("@")), None)
                    if hit is not None:
                        anchor = hit
                        break
        if anchor is None:
            print(f"\n== {kind}: bytes not compared (no anchor)")
            continue
        print(f"\n== {kind}: comparing bytes against the dump")
        for idx, soff, size, syms in laid:
            data = section_bytes(obj, idx)
            rel = relocs.get(idx, {})
            for o in range(0, min(size, len(data)) - 3, 4):
                ours = int.from_bytes(data[o:o + 4], "little")
                addr = anchor + soff + o
                theirs = words.get(addr)
                if theirs is None:
                    continue
                if o in rel:
                    typ, sym = rel[o]
                    target = None if sym.startswith("@") or sym.startswith(".") else by_name.get(sym)
                    if target is None:
                        continue   # a compiler-numbered constant or a section; the link decides
                    ours = (target[0] + ours) & 0xFFFFFFFF
                if ours != theirs[0]:
                    bad += 1
                    who = next((n for v, s, n in syms if v <= o), "?")
                    print(f"  BAD {addr:08X}: ours {ours:08X} retail {theirs[0]:08X}  ({who}+0x{o:X})  {theirs[1]}")
    return bad


if __name__ == "__main__":
    sys.exit(main())
