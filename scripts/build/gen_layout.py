#!/usr/bin/env python3
"""Work out where every byte of the game comes from, and in what order to link it.

Nothing about the layout is written down by hand. Two things are read:

  * ref/asm/objects/<section>.index -- what the disassembler produced, and the
    retail address of each piece. Written by scripts/build/disassemble.py.
  * the compiled objects under build/src -- what the decompiled C++ actually
    provides, taken from their symbol tables.

A symbol defined by one of those objects is sourced from it; everything else is
sourced from the .s the disassembler split out. That is the whole rule -- there
is no list of which file supersedes which, and no statement of whether a piece
of decompilation is "ready". Add a function to a .cpp and the .s holding that
function drops out of the link on the next build.

Ordering falls out of the same data: every contributor is placed at the retail
address it occupies, and the link order is that order.
"""
import argparse
import os
import re
import subprocess
import sys
from collections import defaultdict

SECTIONS = ('main', 'title', 'dun')

# Allocatable section kinds a compiled object can contribute.
ALLOC = ('.text', '.data', '.rodata', '.sdata', '.sbss', '.bss', '.init',
         '.ctor', '.vtables')


def run(*cmd):
    return subprocess.run(cmd, capture_output=True, text=True, check=True).stdout


def retail_symbols(index_dir):
    """{name: address} for every symbol the build can place.

    The per-image indexes, written by disassemble.py: the
    dumps' own names, with retail's table folded in underneath for the names
    they do not define. The ELF is not read here, so a checkout with no disc
    resolves exactly what one with a disc does.
    """
    out = {}
    for section in SECTIONS:
        path = os.path.join(index_dir, f'{section}.index')
        if not os.path.exists(path):
            continue
        with open(path) as f:
            for line in f:
                if line.startswith('#') or not line.strip():
                    continue
                fields = line.rstrip('\n').split('\t')
                if len(fields) != 5:
                    continue
                # Both kinds: a `src` row names the symbol its source defines,
                # so the index carries no `sym` row duplicating it. The
                # exception is a whole-section dump, whose `src` row is named
                # for the span (`main.data`) rather than for any symbol.
                if fields[0] == 'src' and '/sections/' in fields[1]:
                    continue
                out[fields[2]] = int(fields[3], 16)
    return out


def read_index(path):
    """[(source, symbol, vram, size)] as scripts/build/disassemble.py recorded it."""
    rows = []
    with open(path) as f:
        for line in f:
            if line.startswith('#') or not line.strip():
                continue
            fields = line.rstrip('\n').split('\t')
            if len(fields) != 5 or fields[0] != 'src':
                continue
            _kind, src, sym, vram, size = fields
            rows.append((src, sym, int(vram, 16), int(size, 16)))
    return rows


# mwcc numbers a function-local static per translation unit, so the same object
# is `sub_map$101` here and `sub_map$439` in retail. The counter differs because
# retail's translation unit held more functions; the base name does not.
LOCAL_COUNTER = re.compile(r'^(.*?)(?:\$\d+|__\d+)$')


def match_by_base_name(symbol, retail):
    """The retail symbol a differently-numbered local static corresponds to."""
    m = LOCAL_COUNTER.match(symbol)
    if not m:
        return None
    base = m.group(1)
    candidates = [n for n in retail
                  if n != symbol and LOCAL_COUNTER.match(n)
                  and LOCAL_COUNTER.match(n).group(1) == base]
    return candidates[0] if len(candidates) == 1 else None


SEC_HDR = re.compile(r'^\s*\[\s*(\d+)\]\s+(\S+)\s+\S+\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)', re.M)
SYM_ROW = re.compile(r'^\s*\d+:\s+([0-9a-f]+)\s+(\d+)\s+(\S+)\s+(\S+)\s+\S+\s+(\d+)\s+(\S+)', re.M)


def object_contributions(obj, retail, readelf):
    """What one compiled object provides: {section kind: [(symbol, address)]}.

    A section is placed by the retail address of the symbols in it. Sections
    holding no symbol retail knows cannot be placed and are reported instead of
    being guessed at.
    """
    headers = run(readelf, '-SW', obj)
    idx_name, idx_size = {}, {}
    for m in SEC_HDR.finditer(headers):
        idx_name[int(m.group(1))] = m.group(2)
        idx_size[int(m.group(1))] = int(m.group(3), 16)

    bysec = defaultdict(list)
    for m in SYM_ROW.finditer(run(readelf, '-sW', obj)):
        kind, shndx, name = m.group(3), int(m.group(5)), m.group(6)
        if kind in ('FUNC', 'OBJECT', 'NOTYPE') and name in retail:
            bysec[shndx].append((name, retail[name]))

    # symbols in each section regardless of whether retail knows the name, so an
    # unanchored section can still be matched below
    allsec = defaultdict(list)
    for m in SYM_ROW.finditer(run(readelf, '-sW', obj)):
        kind, shndx, name = m.group(3), int(m.group(5)), m.group(6)
        if kind in ('FUNC', 'OBJECT', 'NOTYPE'):
            allsec[shndx].append(name)

    placed, unplaced = {}, []
    for i, name in idx_name.items():
        if name not in ALLOC or idx_size.get(i, 0) == 0:
            continue
        if bysec.get(i):
            placed.setdefault(name, []).extend(bysec[i])
        else:
            unplaced.append((name, idx_size[i], allsec.get(i, [])))
    return placed, unplaced


def migrated_sections(manifest):
    """Section dumps the migration carves, from asm/migrated_symbols.txt."""
    out = set()
    if not os.path.exists(manifest):
        return out
    with open(manifest) as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#'):
                out.add(line.split()[0])
    return out


def write_link_order(args, contributors, obj_section, objs):
    """One mwld response file per section, in retail address order.

    This is the link order, and nothing else states it: each object goes where
    the address of its lowest-addressed contribution puts it. An object that
    contributes in several places is listed once, at the first of them.

    A whole-section dump is excluded only when migration carves it: the carved
    parts replace it and --main-tail supplies them. The sections with no
    migrations -- main.vutext, main.vudata -- are still assembled straight from
    their dump and linked here.
    """
    carved = migrated_sections(args.migrate_manifest)
    order = defaultdict(list)

    for section, vram, src, sym, kind in sorted(
            contributors, key=lambda c: (c[1], c[2])):
        if kind == 'asm':
            if os.path.basename(src)[:-2] in carved:
                continue
            order[section].append(f'{args.build_dir}/{src}.o')
        else:
            order[obj_section.get(os.path.basename(src), 'main')].append(src)

    for section in SECTIONS:
        seen, out = set(), []
        for obj in order[section]:
            if obj not in seen:
                seen.add(obj)
                out.append(obj)
        if section == 'main':
            out += args.main_tail

        path = os.path.join(args.link_order_dir, f'{section}_o_files')
        with open(path, 'w') as f:
            f.write(' '.join(out) + '\n')


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--index-dir', default='ref/asm/objects')
    ap.add_argument('--obj-dir', default='build/src')
    ap.add_argument('--prefix', default=os.environ.get('MIPS_TOOL_PREFIX', 'mips-ps2-decompals-'))
    ap.add_argument('--provenance', default='build/symbol_provenance.txt')
    ap.add_argument('--build-dir', default='build')
    ap.add_argument('--migrate-manifest', default='asm/migrated_symbols.txt')
    ap.add_argument('--link-order-dir',
                    help='write <section>_o_files response files here')
    ap.add_argument('--main-tail', nargs='*', default=[],
                    help='objects appended to main after the address-ordered ones')
    ap.add_argument('--verbose', action='store_true',
                    help='also echo every symbol and its provider to stdout')
    args = ap.parse_args()

    readelf = args.prefix + 'readelf'
    retail = retail_symbols(args.index_dir)

    objs = sorted(f for f in os.listdir(args.obj_dir) if f.endswith('.o')) \
        if os.path.isdir(args.obj_dir) else []

    # What the decompiled C++ provides, and the address span each section covers.
    spans = []      # (lo, hi, object, section kind)
    provided = {}   # symbol -> (object, section kind)
    unplaced, rematched = [], []
    for o in objs:
        path = os.path.join(args.obj_dir, o)
        placed, missing = object_contributions(path, retail, readelf)
        for kind, syms in placed.items():
            addrs = [a for _, a in syms]
            spans.append((min(addrs), max(addrs), o, kind))
            for name, addr in syms:
                provided[name] = (o, kind, addr)
        for kind, size, syms in missing:
            matched = [(sym, retail[m]) for sym in syms
                       for m in [match_by_base_name(sym, retail)] if m]
            if matched:
                addrs = [a for _, a in matched]
                spans.append((min(addrs), max(addrs), o, kind))
                for sym, addr in matched:
                    provided[sym] = (o, kind, addr)
                rematched.append((o, kind, syms[0], matched[0][1]))
            else:
                unplaced.append((o, kind, size, syms))

    # Every contributor, at the address retail keeps it.
    contributors, superseded = [], []
    # Which section each compiled object belongs to, taken from the .s it
    # supersedes. An object that supersedes nothing is data-only and goes with
    # the main application, which is the only place data migration applies.
    obj_section = {}
    for section in SECTIONS:
        index = os.path.join(args.index_dir, f'{section}.index')
        if not os.path.exists(index):
            continue
        for src, sym, vram, size in read_index(index):
            owner = next((o for lo, hi, o, k in spans
                          if k == '.text' and lo <= vram <= hi), None)
            if owner:
                superseded.append((src, sym, vram, owner))
                obj_section[owner] = section
            else:
                contributors.append((section, vram, src, sym, 'asm'))
    for lo, hi, o, kind in spans:
        contributors.append((None, lo, os.path.join(args.obj_dir, o), kind, 'cpp'))

    if args.link_order_dir:
        write_link_order(args, contributors, obj_section, objs)

    # Consistency checks. Both of these are silent wrong-binary bugs otherwise:
    # a span that swallows a function its object does not define leaves a hole
    # where retail has code, and two objects claiming the same address means one
    # of them is not where it thinks it is.
    problems = []
    text_spans = [(lo, hi, o) for lo, hi, o, k in spans if k == '.text']
    for lo, hi, o in text_spans:
        for _sec, vram, src, sym, kind in contributors:
            if kind == 'asm' and lo <= vram <= hi:
                problems.append(
                    f'{o} spans {lo:#010x}..{hi:#010x} but does not define '
                    f'{sym} at {vram:#010x}; {src} would be left out of the link')
    for i, (lo1, hi1, o1, k1) in enumerate(spans):
        for lo2, hi2, o2, k2 in spans[i + 1:]:
            if o1 != o2 and lo1 <= hi2 and lo2 <= hi1:
                problems.append(
                    f'{o1}({k1}) {lo1:#010x}..{hi1:#010x} overlaps '
                    f'{o2}({k2}) {lo2:#010x}..{hi2:#010x}')

    from_cpp = len(provided)
    from_asm = sum(1 for c in contributors if c[4] == 'asm')

    with open(args.provenance, 'w') as f:
        f.write('# Where each symbol in the build comes from.\n')
        f.write('# Generated by scripts/build/gen_layout.py; do not edit.\n')
        f.write('#\n# address\tprovider\tsource\tsymbol\n')
        rows = [(vram, 'asm', src, sym) for _s, vram, src, sym, k in contributors if k == 'asm']
        rows += [(addr, 'cpp', f'{o}({k})', s) for s, (o, k, addr) in provided.items()]
        for vram, kind, src, sym in sorted(rows):
            f.write(f'{vram:#010x}\t{kind}\t{src}\t{sym}\n')
        if problems:
            f.write('\n# LAYOUT PROBLEMS:\n')
            for msg in problems:
                f.write(f'#   {msg}\n')
        if rematched:
            f.write('\n# Local statics matched by base name, mwcc having numbered\n'
                    '# them differently here than in the retail translation unit:\n')
            for o, k, sym, addr in rematched:
                f.write(f'#   {o} {k} {sym} -> {addr:#010x}\n')
        if unplaced:
            f.write('\n# Provided by the C++ but matching nothing in retail. These are\n'
                    '# extra definitions, not placements, and the linker sites them:\n')
            for o, k, sz, syms in unplaced:
                f.write(f'#   {o} {k} ({sz:#x} bytes) {",".join(syms)}\n')

    print(f'layout: {from_cpp} symbols from cpp, {from_asm} from asm, '
          f'{len(superseded)} .s superseded, {len(rematched)} rematched, '
          f'{len(unplaced)} unanchored -> {args.provenance}')
    if args.verbose:
        for vram, kind, src, sym in sorted(rows):
            print(f'  {vram:#010x} {kind:3} {sym}  <- {src}')
    for o, k, sz, syms in unplaced:
        print(f'  unanchored: {o} {k} ({sz:#x} bytes) {",".join(syms)}', file=sys.stderr)
    for msg in problems:
        print(f'  ERROR: {msg}', file=sys.stderr)
    if problems:
        print(f'gen_layout: {len(problems)} layout problem(s); '
              f'the link would not reproduce retail', file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
