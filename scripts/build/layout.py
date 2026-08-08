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

SECTIONS = ('main', 'title', 'dun')

INDEX_DIR = 'ref/asm/objects'
SRC_DIR = 'src'
LCF = 'SCUS_971.11.lcf'

MARKER = re.compile(r'^INCLUDE_(?:ASM|RODATA)\s*\(\s*"([^"]*)"\s*,\s*([^)\s]+)\s*\)',
                    re.M)

# A unit's placement in the linker script: the object, the section it is placed
# by, and the retail address it starts at. Which image it belongs to is the
# section -- the overlays' objects carry privately-prefixed names.
PLACEMENT = re.compile(
    r'^\s*(\S+)\.o\s*\(\s*(\.[td]?text)\s*\)\s*//\s*(0x[0-9a-fA-F]+)\s*$', re.M)
IMAGE_OF = {'.text': 'main', '.ttext': 'title', '.dtext': 'dun'}

# objdiff runs `<custom_make> <custom_args...> <object path>` to rebuild. The
# path is meaningless here -- this project builds in one step -- so the trailing
# argument is swallowed by handing it to `sh -c` as $0.
OBJDIFF = {
    'min_version': '2.0.0-beta.5',
    'custom_make': 'sh',
    'custom_args': ['-c', 'exec scripts/build/build_objdiff.sh'],
    'build_target': False,
    'build_base': True,
    'watch_patterns': ['src/**/*.{c,cpp,h,hpp,s,inc,lcf}',
                       'include/**/*.{h,hpp,s,inc,lcf}'],
}


def read_index(index_dir=INDEX_DIR):
    """(functions, dumps, address_of) for every image.

    `functions` is one row per per-function dump, `dumps` one per whole-section
    dump the link can take, and `address_of` maps every name the index knows --
    including the constants, which have no source row -- to its address.
    """
    functions = {s: [] for s in SECTIONS}
    dumps = {s: [] for s in SECTIONS}
    address_of = {}

    for section in SECTIONS:
        path = os.path.join(index_dir, f'{section}.index')
        if not os.path.exists(path):
            continue
        with open(path) as f:
            for line in f:
                if line.startswith('#'):
                    continue
                row = line.rstrip('\n').split('\t')
                if len(row) != 5:
                    continue
                kind, source, symbol, vram, size = row
                address_of[symbol] = int(vram, 16)
                if kind != 'src':
                    continue
                if '/split/' in source:
                    functions[section].append((int(vram, 16), symbol,
                                               int(size, 16), source))
                else:
                    dumps[section].append((int(vram, 16), symbol, source))
        functions[section].sort()
        dumps[section].sort()
    return functions, dumps, address_of


def read_sources(src_dir=SRC_DIR):
    """{source: [(image, symbol)]} for every marker, in the order written."""
    out = {}
    for root, _dirs, files in os.walk(src_dir):
        for name in sorted(files):
            if not name.endswith(('.c', '.cpp')):
                continue
            path = os.path.join(root, name)
            text = open(path, encoding='utf-8', errors='replace').read()
            out[path] = MARKER.findall(text)
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
        print(f'  ERROR: {path} places {name}.o, which no source under '
              f'{SRC_DIR}/ builds', file=sys.stderr)
    # mwld identifies an object by base name alone and segfaults without a
    # diagnostic when two collide, so this cannot be allowed through either.
    for name in ambiguous:
        print(f'  ERROR: {name} is built from more than one source',
              file=sys.stderr)
    if missing or ambiguous:
        raise SystemExit(1)

    out.sort()
    return out


def owners(placed, section):
    """[(start, end, source)] for one image, covering it end to end."""
    spans = [(a, s) for a, img, s in placed if img == section]
    return [(a, spans[i + 1][0] if i + 1 < len(spans) else None, s)
            for i, (a, s) in enumerate(spans)]


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
            source = marked.get((section, symbol))
            if source and owner_of(spans, address) != source:
                problems.append(
                    f'{symbol} at {address:#010x} is marked in {source}, but that '
                    f'address belongs to {owner_of(spans, address)}')
    return problems


def link_order(args, placed, dumps, carved):
    """One mwld response file per image, in retail address order.

    A whole-section dump is excluded when the migration carves it: the carved
    parts replace it and --main-tail supplies them.
    """
    for section in SECTIONS:
        items = [(a, f'{args.build_dir}/{s}.o') for a, img, s in placed if img == section]
        items += [(a, f'{args.build_dir}/{src}.o')
                  for a, name, src in dumps[section] if name not in carved]
        items.sort()

        out, seen = [], set()
        for _a, obj in items:
            if obj not in seen:
                seen.add(obj)
                out.append(obj)
        if section == 'main':
            out += args.main_tail

        with open(os.path.join(args.link_order, f'{section}_o_files'), 'w') as f:
            f.write(' '.join(out) + '\n')
    return sum(1 for _ in placed)


def provenance(path, placed, functions, marked, build_dir):
    """Where each function comes from, for reading rather than for the build."""
    rows = []
    for section in SECTIONS:
        spans = owners(placed, section)
        for address, symbol, _size, _src in functions[section]:
            source = owner_of(spans, address)
            kind = 'asm' if marked.get((section, symbol)) else 'cpp'
            rows.append((address, kind, f'{build_dir}/{source}.o', symbol))
    rows.sort()
    with open(path, 'w') as f:
        f.write('# Where each function in the build comes from.\n')
        f.write('# Generated by scripts/build/layout.py; do not edit.\n')
        f.write('#\n# address\tprovider\tsource\tsymbol\n')
        for address, kind, source, symbol in rows:
            f.write(f'{address:#010x}\t{kind}\t{source}\t{symbol}\n')
    return sum(1 for r in rows if r[1] == 'cpp'), sum(1 for r in rows if r[1] == 'asm')


def objdiff(path, placed, functions, marked, build_dir):
    """objdiff.json: one unit per retail function.

    The target is that function's reference dump assembled as retail wrote it.
    The base is the object of the unit that owns it -- or nothing, when a marker
    supplies the function, which scores the unit at zero. Pairing every function
    that way makes the percentage a share of the whole game.
    """
    unit_list, decompiled = [], 0
    for section in SECTIONS:
        spans = owners(placed, section)
        for address, symbol, _size, source in functions[section]:
            unit = {'name': f'{section}/{symbol}',
                    'target_path': f'{build_dir}/{source}.o'}
            if marked.get((section, symbol)):
                unit['metadata'] = {'complete': False}
            else:
                owner = owner_of(spans, address)
                if owner:
                    unit['base_path'] = f'{build_dir}/{owner}.o'
                    decompiled += 1
            unit_list.append(unit)

    config = dict(OBJDIFF, name='dcdecomp', units=unit_list)
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(config, f, indent=2)
        f.write('\n')
    return len(unit_list), decompiled


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('--link-order', help='write <image>_o_files here')
    ap.add_argument('--objdiff', help='write the objdiff unit list here')
    ap.add_argument('--provenance', help='write the symbol provenance here')
    ap.add_argument('--build-dir', default='build')
    ap.add_argument('--lcf', default=LCF, help='the linker script to read the '
                    'unit placement from')
    ap.add_argument('--main-tail', nargs='*', default=[],
                    help='objects appended to main after the address-ordered ones')
    ap.add_argument('--list-extra-objects', action='store_true',
                    help='print the dumps objdiff needs as targets')
    ap.add_argument('--carved', nargs='*', default=[],
                    help='section dumps the migration replaces')
    args = ap.parse_args()

    functions, dumps, _address_of = read_index()

    if args.list_extra_objects:
        # Every per-function dump. The ordinary build assembles none of them --
        # a marker reads the dump through tools/mwccgap instead -- but objdiff
        # needs each as the target its unit is compared against, so they are
        # built under the objdiff target alone.
        print('\n'.join(src for s in SECTIONS for _a, _n, _z, src in functions[s]))
        return 0

    sources = read_sources()
    placed = read_units(sources, args.lcf)

    marked = {}
    for source, markers in sources.items():
        for image, symbol in markers:
            marked[(image, symbol)] = source

    problems = check(placed, functions, marked)
    for message in problems:
        print(f'  ERROR: {message}', file=sys.stderr)
    if problems:
        print(f'layout: {len(problems)} problem(s); the link would not reproduce '
              f'retail', file=sys.stderr)
        return 1

    if args.link_order:
        n = link_order(args, placed, dumps, set(args.carved))
        print(f'layout: {n} translation units in address order -> '
              f'{args.link_order}/<image>_o_files')
    if args.provenance:
        cpp, asm = provenance(args.provenance, placed, functions, marked,
                              args.build_dir)
        print(f'layout: {cpp} functions from cpp, {asm} from asm -> {args.provenance}')
    if args.objdiff:
        total, done = objdiff(args.objdiff, placed, functions, marked, args.build_dir)
        print(f'layout: {total} objdiff units, {done} with a decompiled base -> '
              f'{args.objdiff}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
