#!/usr/bin/env python3
"""Carve and split a monolithic reference section dump in one pass, driven by the
migration manifest (asm/migrated_symbols.txt).

Everything a section's layout needs comes from the immutable reference dump --
the byte range and adjacency of every symbol -- plus the manifest, whose
per-line format is:

    <section> <symbol> [<object>[:<elf-section>]]

  <section>      dump basename without ".s", e.g. "main.sbss".
  <symbol>       the exact glabel name in that dump, or `@0xSTART+0xSIZE` for
                 an anonymous range the disassembler left unlabelled.
  <object>       the compiled object supplying the symbol's real bytes. With
                 one the symbol becomes an "island", placed exactly into its
                 retail hole; without, it is only carved -- a zero `.space`
                 filler keeps its neighbours' addresses -- and the generic
                 `*(.sec)` wildcard places the bytes. `@DIRECTIVE`
                 (`@LITERAL`, `@EXCEPTION`) means one of MWLD's own regions
                 fills it; its size is unknown until link time, so gen_lcf.py
                 pads to an absolute address instead of a computed offset.
  <elf-section>  the object's ELF section filling the hole when it differs
                 from the dump's own, e.g. main.cpp.o's `.init`/`.ctor`
                 filling holes in the main.rodata dump.

An island is a maximal run of adjacent migrated-with-object holes, adjacent
meaning the only thing between them is auto-generated alignment padding
(anonymous `B_<hex>` labels). A real un-migrated symbol between two holes ends
the island and is kept as a raw "part", re-linked verbatim. Each island records
the (object, elf-section) sequence that fills it and its total span, interior
pads included; the trailing pad is computed at LCF-generation time. See
docs/RE/sbss_bss_layout.md.

Emits the split part .s files plus a plan JSON describing the interleaving of
parts and islands; a section with no islands emits one whole carved file.

Modes:
    --list-sections <manifest>
    --list-parts <ref.s> <manifest> <section> <outdir>
    --emit <ref.s> <manifest> <section> <outdir>
"""
import argparse
import json
import os
import re
import sys

GLABEL_RE = re.compile(r'^glabel\s+(\S+)\s*$')
# The address comment spimdisasm puts on each line. Sections with file
# backing carry `/* fileoffset vaddr [word] */`; .bss and .sbss occupy no
# file space and so carry only `/* vaddr */`. The vaddr is therefore the
# second field when there is one and the first when there is not.
ADDR_RE = re.compile(r'^/\*\s*([0-9A-Fa-f]+)(?:\s+([0-9A-Fa-f]+))?[^*]*\*/')


def label_address(match):
    """The vaddr out of an ADDR_RE match."""
    return int(match.group(2) or match.group(1), 16)
PAD_NAME_RE = re.compile(r'^B_[0-9A-Fa-f]+$')
# Anonymous address range used in place of a symbol name: @0xSTART+0xSIZE
REGION_RE = re.compile(r'^@(0[xX][0-9A-Fa-f]+)\+(0[xX][0-9A-Fa-f]+)$')


def region_bounds(name):
    """(start, size) for an `@0xSTART+0xSIZE` manifest key, else None."""
    m = REGION_RE.match(name)
    if not m:
        return None
    return int(m.group(1), 16), int(m.group(2), 16)


def is_linker_region(obj):
    """True for an `@DIRECTIVE` provider (MWLD fills the hole itself)."""
    return bool(obj) and obj.startswith('@')


def parse_manifest(manifest_path):
    """Return {section: {symbol: (object_or_None, elf_section_or_None)}}."""
    sections = {}
    with open(manifest_path) as f:
        for lineno, raw in enumerate(f, 1):
            line = raw.split('#', 1)[0].strip()
            if not line:
                continue
            parts = line.split()
            if len(parts) < 2:
                print(f'{manifest_path}:{lineno}: malformed line, expected '
                      f'"<section> <symbol> [<object>[:<elf-section>]]": {raw!r}',
                      file=sys.stderr)
                continue
            sec, name = parts[0], parts[1]
            obj = elf_sec = None
            if len(parts) >= 3:
                obj, _, elf_sec = parts[2].partition(':')
                elf_sec = elf_sec or None
            sections.setdefault(sec, {})[name] = (obj, elf_sec)
    return sections


def find_labels(lines):
    """[(line_index, name, address_or_None), ...] for every `glabel NAME`,
    address read from the immediately following `/* fileoff vaddr ... */`."""
    labels = []
    for i, line in enumerate(lines):
        m = GLABEL_RE.match(line)
        if not m:
            continue
        addr = None
        for j in range(i + 1, len(lines)):
            am = ADDR_RE.match(lines[j])
            if am:
                addr = label_address(am)
                break
            if lines[j].strip() == '':
                continue
            break
        labels.append((i, m.group(1), addr))
    return labels


def preamble_end(lines):
    """Line index just past the first `.section` directive (the assembler
    preamble: .include/.set/.section), so a part assembles standalone into
    the same section."""
    for i, line in enumerate(lines):
        if line.lstrip().startswith('.section'):
            return i + 1
    return None


def default_elf_section(section):
    """Dump 'main.sbss' -> wildcard ELF section '.sbss'."""
    return '.' + section.split('.', 1)[1]


def compute_layout(lines, migrated):
    """Compute the split plan for one section.

    `migrated` is {symbol: (object_or_None, elf_section_or_None)}.

    Returns (sequence, labels_by_line) where sequence is an ordered list of:
        {'kind': 'part',   'first': line_idx, 'stop': line_idx}
        {'kind': 'island', 'objs': [(obj, sec), ...], 'size': int,
         'first': line_idx, 'stop': line_idx}
    'first'/'stop' are original-dump line indices (stop exclusive) for parts;
    for islands they bound the dropped range.
    """
    labels = find_labels(lines)
    n = len(lines)
    # Anonymous `@0xSTART+0xSIZE` keys are resolved by address, not by label.
    region_keys = {name: region_bounds(name) for name in migrated
                   if region_bounds(name) is not None}
    # Resolve address + size + next-label-line for every label.
    info = []  # (line_idx, name, addr, size, next_line)
    for k, (li, name, addr) in enumerate(labels):
        next_line = n
        next_addr = None
        for li2, _, addr2 in labels[k + 1:]:
            next_line = li2
            if addr2 is not None:
                next_addr = addr2
                break
        size = None if (addr is None or next_addr is None) else next_addr - addr
        info.append((li, name, addr, size, next_line))

    def is_pad(name):
        return bool(PAD_NAME_RE.match(name))

    # Group islands: walk labels in dump order.
    islands = []  # each: {objs, start_addr, end_addr, first_line, last_next_line}
    cur = None
    for (li, name, addr, size, next_line) in info:
        mapping = migrated.get(name)
        if mapping is not None and mapping[0] is not None:
            # migrated, object-mapped -> island member
            obj = mapping[0]
            sec = mapping[1] or None  # resolved to default later
            if size is None:
                raise SystemExit(
                    f'migrate_section: cannot size island symbol {name!r} '
                    f'(is it the last label in the dump?)')
            if cur is None:
                cur = {'objs': [], 'start_addr': addr, 'first_line': li,
                       'end_addr': addr + size, 'last_next_line': next_line}
            cur['objs'].append((obj, sec))
            cur['end_addr'] = addr + size
            cur['last_next_line'] = next_line
        elif is_pad(name) and cur is not None:
            # interior-or-trailing alignment pad: hold. If a further island
            # member follows it is interior (already inside the span); if a
            # real label follows, the island closes below and this pad stays
            # in the next part (we do NOT extend end_addr / last_next_line
            # for a pad, so trailing pads are excluded from the island).
            pass
        else:
            # real content, or a carve-only (unmapped) migrated symbol -> ends
            # any open island.
            if cur is not None:
                islands.append(cur)
                cur = None
    if cur is not None:
        islands.append(cur)

    # Collapse consecutive identical (obj, sec) within each island.
    for isl in islands:
        collapsed = []
        for obj, sec in isl['objs']:
            if not collapsed or collapsed[-1] != (obj, sec):
                collapsed.append((obj, sec))
        isl['objs'] = collapsed
        isl['size'] = isl['end_addr'] - isl['start_addr']

    # Add address-identified regions as islands of their own. Their line range
    # is found from the dump's own address comments, since they carry no label.
    for name, (start, size) in sorted(region_keys.items(), key=lambda kv: kv[1]):
        obj, sec = migrated[name]
        if obj is None:
            raise SystemExit(
                f'migrate_section: anonymous region {name!r} needs a provider '
                f'(an object or an @DIRECTIVE) -- a carve-only anonymous range '
                f'would just be a hole nothing fills.')
        first_line = stop_line = None
        for i, line in enumerate(lines):
            am = ADDR_RE.match(line)
            if not am:
                continue
            addr = label_address(am)
            if first_line is None and addr >= start:
                if addr != start:
                    raise SystemExit(
                        f'migrate_section: anonymous region {name!r} does not '
                        f'start on a dump line boundary (first line at or past '
                        f'0x{start:X} is 0x{addr:X}).')
                first_line = i
            if first_line is not None and addr >= start + size:
                stop_line = i
                break
        if first_line is None:
            raise SystemExit(
                f'migrate_section: anonymous region {name!r} is not inside '
                f'this dump.')
        if stop_line is None:
            stop_line = n
        islands.append({'objs': [(obj, sec)], 'size': size,
                        'start_addr': start, 'end_addr': start + size,
                        'first_line': first_line, 'last_next_line': stop_line})

    islands.sort(key=lambda i: i['first_line'])
    for a, b in zip(islands, islands[1:]):
        if a['last_next_line'] > b['first_line']:
            raise SystemExit(
                f'migrate_section: overlapping migrated regions at '
                f'0x{a["start_addr"]:X} and 0x{b["start_addr"]:X}.')

    # Build the ordered part/island sequence in line-index terms.
    sequence = []
    pos = 0
    for isl in islands:
        sequence.append({'kind': 'part', 'first': pos, 'stop': isl['first_line']})
        sequence.append({'kind': 'island', 'objs': isl['objs'],
                         'size': isl['size'], 'end_addr': isl['end_addr'],
                         'first': isl['first_line'], 'stop': isl['last_next_line']})
        pos = isl['last_next_line']
    sequence.append({'kind': 'part', 'first': pos, 'stop': n})
    return sequence, {li: (name, addr, size, next_line)
                      for (li, name, addr, size, next_line) in info}


def carve_replacement(name, size):
    return [
        f'/* carved: {name} migrated to real C/C++ source -- see '
        f'asm/migrated_symbols.txt */\n',
        f'.space 0x{size:X}\n',
        '\n',
    ]


def render_part(lines, first, stop, pre_end, info_by_line, migrated,
                include_preamble):
    """Render a part's lines from original-dump range [first, stop), applying
    carve (drop glabel, emit marker+.space) to any surviving *unmapped*
    migrated symbol in range. `include_preamble` prepends the assembler
    preamble for parts that don't start at line 0."""
    out = []
    if include_preamble:
        out.extend(lines[:pre_end])
    i = first
    while i < stop:
        if i in info_by_line:
            name, addr, size, next_line = info_by_line[i]
            if name in migrated and size is not None:
                # A migrated symbol surviving inside a part is carve-only
                # (unmapped); replace its block with a same-size filler.
                out.extend(carve_replacement(name, size))
                i = min(next_line, stop)
                continue
        out.append(lines[i])
        i += 1
    return out


def body_is_empty(part_lines, pre_end):
    """True if a part contributes no assembled content (only preamble /
    blank / comment lines).

    Dump data lines lead with an address comment (`/* off vaddr word */ .word
    ...`), so a leading block comment must be stripped before deciding --
    testing `startswith('/*')` alone would classify every data line as a
    comment."""
    for ln in part_lines[pre_end:]:
        s = ln.strip()
        while s.startswith('/*'):
            end = s.find('*/')
            if end < 0:
                s = ''
                break
            s = s[end + 2:].strip()
        if not s:
            continue
        if s.startswith('#') or s.startswith('//'):
            continue
        return False
    return True


def plan_section(lines, migrated, section):
    """Return (parts, plan) where parts is a list of (filename, lines) and
    plan is the JSON-able ordered sequence. Filenames are basenames."""
    sequence, info_by_line = compute_layout(lines, migrated)
    pre_end = preamble_end(lines)
    wildcard = default_elf_section(section)
    has_island = any(item['kind'] == 'island' for item in sequence)

    if not has_island:
        # Single whole carved file, placed by the generic wildcard.
        whole = render_part(lines, 0, len(lines), pre_end, info_by_line,
                            migrated, include_preamble=False)
        fname = f'{section}.s'
        return [(fname, whole)], {'section': section, 'wildcard': wildcard,
                                  'sequence': [{'type': 'whole', 'file': fname}]}

    parts = []
    plan_seq = []
    part_no = 0
    for item in sequence:
        if item['kind'] == 'part':
            include_pre = (item['first'] != 0)
            body = render_part(lines, item['first'], item['stop'], pre_end,
                               info_by_line, migrated, include_pre)
            # render_part prepends lines[:pre_end] when include_pre, and the
            # first part starts with that same preamble, so either way the
            # first pre_end lines of `body` are the preamble.
            if body_is_empty(body, pre_end):
                # Empty leading/trailing part -> island sits at the section
                # boundary; omit it (objects placed first/last).
                continue
            part_no += 1
            fname = f'{section}.part{part_no}.s'
            parts.append((fname, body))
            plan_seq.append({'type': 'part', 'file': fname})
        else:
            objs = [[obj, sec if is_linker_region(obj) else (sec or wildcard)]
                    for (obj, sec) in item['objs']]
            plan_seq.append({'type': 'island', 'size': item['size'],
                             'end_addr': item['end_addr'], 'objs': objs})
    plan = {'section': section, 'wildcard': wildcard, 'sequence': plan_seq}
    return parts, plan


def load_section(ref_path, manifest_path, section):
    with open(ref_path) as f:
        lines = f.readlines()
    migrated = parse_manifest(manifest_path).get(section, {})
    return plan_section(lines, migrated, section)


def main():
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--list-sections', action='store_true')
    ap.add_argument('--list-contrib-objs', action='store_true')
    ap.add_argument('--list-parts', action='store_true')
    ap.add_argument('--emit', action='store_true')
    ap.add_argument('args', nargs='*')
    a = ap.parse_args()

    if a.list_sections:
        (manifest_path,) = a.args
        secs = sorted(parse_manifest(manifest_path).keys())
        print(' '.join(secs))
        return 0

    if a.list_contrib_objs:
        # Every distinct object referenced by a manifest object-mapping (the
        # objects gen_lcf.py must objdump for padding). Basenames only.
        (manifest_path,) = a.args
        objs = set()
        for syms in parse_manifest(manifest_path).values():
            for obj, _ in syms.values():
                # @DIRECTIVE providers are linker regions, not real objects.
                if obj and not is_linker_region(obj):
                    objs.add(obj)
        print(' '.join(sorted(objs)))
        return 0

    ref_path, manifest_path, section, outdir = a.args
    parts, plan = load_section(ref_path, manifest_path, section)

    if a.list_parts:
        for fname, _ in parts:
            print(os.path.join(outdir, fname))
        return 0

    if a.emit:
        os.makedirs(outdir, exist_ok=True)
        for fname, body in parts:
            with open(os.path.join(outdir, fname), 'w') as f:
                f.writelines(body)
        with open(os.path.join(outdir, f'{section}.plan.json'), 'w') as f:
            json.dump(plan, f, indent=2)
            f.write('\n')
        island_ct = sum(1 for it in plan['sequence'] if it.get('type') == 'island')
        print(f'migrate_section: {section}: {len(parts)} part(s), '
              f'{island_ct} island(s)')
        return 0

    ap.error('one of --list-sections/--list-parts/--emit is required')


if __name__ == '__main__':
    sys.exit(main())
