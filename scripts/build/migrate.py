#!/usr/bin/env python3
"""Put decompiled data back where retail keeps it.

    migrate.py --list-sections <manifest>
    migrate.py --list-contrib-objs <manifest>
    migrate.py --list-parts <ref.s> <manifest> <section> <outdir>
    migrate.py --emit <ref.s> <manifest> <section> <outdir>
    migrate.py --lcf <template> <generated-dir> <objdir> <out>

A function or a constant carries retail's own bytes inside the object that
supplies it, through an INCLUDE_ASM or INCLUDE_RODATA marker. Data cannot:
tools/mwccgap has no equivalent for .data or .bss. So a decompiled global is
carved out of the reference dump that holds it -- leaving a hole its bytes are
not linked into twice -- and the linker script places the object's own version
exactly into that hole ("island"). Everything else in the dump keeps its retail
address.

The first four modes do the carving, driven by asm/decompiled_symbols.txt; the
last writes the linker script that places the results. They are one job and one
file because the plan the carving writes is the only input the placement has.
"""

import argparse
import json
import os
import re
import subprocess
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
def parse_manifest(manifest_path):
    """{symbol: (object, elf_section_or_None)} from asm/decompiled_symbols.txt."""
    out = {}
    with open(manifest_path) as f:
        for lineno, raw in enumerate(f, 1):
            line = raw.split('#', 1)[0].strip()
            if not line:
                continue
            parts = line.split()
            if len(parts) != 2:
                print(f'{manifest_path}:{lineno}: malformed line, expected '
                      f'"<symbol> <source>[:<elf-section>]": {raw!r}',
                      file=sys.stderr)
                continue
            name, provider = parts
            source, _, elf_sec = provider.partition(':')
            out[name] = (os.path.basename(source) + '.o', elf_sec or None)
    return out


def symbol_sections(index_dir='ref/asm/objects'):
    """{symbol: dump} -- which whole-section dump holds each symbol.

    Derived rather than written down: the address index records both each
    dump's span and each symbol's address, so the dump a symbol belongs to
    follows from where it sits. A symbol in no dump -- every .rodata constant,
    which is supplied a constant at a time instead -- simply does not appear.
    """
    spans, where = [], {}
    for name in sorted(os.listdir(index_dir)) if os.path.isdir(index_dir) else []:
        if not name.endswith('.index'):
            continue
        rows = []
        with open(os.path.join(index_dir, name)) as f:
            for line in f:
                if line.startswith('#'):
                    continue
                row = line.rstrip('\n').split('\t')
                if len(row) != 5:
                    continue
                rows.append(row)
        for kind, src, sym, vram, size in rows:
            if kind == 'src' and '/sections/' in src:
                spans.append((int(vram, 16), int(vram, 16) + int(size, 16), sym))
        for kind, src, sym, vram, size in rows:
            address = int(vram, 16)
            for lo, hi, dump in spans:
                if lo <= address < hi:
                    where[sym] = dump
                    break
    return where


def manifest_by_section(manifest_path, index_dir='ref/asm/objects'):
    """{dump: {symbol: (object, elf_section)}} for the dumps that get carved."""
    where = symbol_sections(index_dir)
    out = {}
    for name, entry in parse_manifest(manifest_path).items():
        dump = where.get(name)
        if dump:
            out.setdefault(dump, {})[name] = entry
    return out


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
                    f'migrate: cannot size island symbol {name!r} '
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

    islands.sort(key=lambda i: i['first_line'])
    for a, b in zip(islands, islands[1:]):
        if a['last_next_line'] > b['first_line']:
            raise SystemExit(
                f'migrate: overlapping migrated regions at '
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
        f'asm/decompiled_symbols.txt */\n',
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
            objs = [[obj, sec or wildcard] for (obj, sec) in item['objs']]
            plan_seq.append({'type': 'island', 'size': item['size'],
                             'end_addr': item['end_addr'], 'objs': objs})
    plan = {'section': section, 'wildcard': wildcard, 'sequence': plan_seq}
    return parts, plan


def load_section(ref_path, manifest_path, section):
    with open(ref_path) as f:
        lines = f.readlines()
    migrated = manifest_by_section(manifest_path).get(section, {})
    return plan_section(lines, migrated, section)


def main():
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--list-sections', action='store_true')
    ap.add_argument('--list-contrib-objs', action='store_true')
    ap.add_argument('--list-parts', action='store_true')
    ap.add_argument('--emit', action='store_true')
    ap.add_argument('--lcf', action='store_true')
    ap.add_argument('args', nargs='*')
    a, rest = ap.parse_known_args()

    if a.lcf:
        # The four paths land in the shared positional list; any flag of its
        # own -- --objdump -- lands in `rest`.
        return lcf_main(rest + a.args)

    if a.list_sections:
        (manifest_path,) = a.args
        secs = sorted(manifest_by_section(manifest_path).keys())
        print(' '.join(secs))
        return 0

    if a.list_contrib_objs:
        # Every distinct object referenced by a manifest object-mapping (the
        # objects the linker script must objdump for padding). Basenames only.
        (manifest_path,) = a.args
        objs = set()
        for syms in manifest_by_section(manifest_path).values():
            for obj, _ in syms.values():
                if obj:
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
        print(f'migrate: {section}: {len(parts)} part(s), '
              f'{island_ct} island(s)')
        return 0

    ap.error('one of --list-sections/--list-parts/--emit is required')




MARKER_RE = re.compile(r'^(\s*)//\s*@MIGRATE\s+(\S+)\s*$')
# A bare MWLD region directive in the template (LITERAL / EXCEPTION). When a
# manifest entry has placed that region into a retail hole, its standalone
# occurrence here must not emit it a second time.
DIRECTIVE_RE = re.compile(r'^(\s*)(LITERAL|EXCEPTION)\s*$')
OBJDUMP_H_RE = re.compile(
    r'^\s*\d+\s+(\S+)\s+([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+[0-9a-fA-F]+\s+'
    r'[0-9a-fA-F]+\s+2\*\*(\d+)')


def object_sections(obj_path, objdump):
    """Return {section_name: [(size, alignment), ...]} in header order."""
    out = subprocess.run([objdump, '-h', obj_path],
                         capture_output=True, text=True, check=True).stdout
    secs = {}
    for line in out.splitlines():
        m = OBJDUMP_H_RE.match(line)
        if not m:
            continue
        name, size_hex, align_pow = m.group(1), m.group(2), int(m.group(3))
        secs.setdefault(name, []).append((int(size_hex, 16), 1 << align_pow))
    return secs


def align_up(off, align):
    if align <= 1:
        return off
    return (off + align - 1) & ~(align - 1)


def linker_consumed(objs, objdir, objdump, cache):
    off = 0
    for obj, sec in objs:
        if obj not in cache:
            cache[obj] = object_sections(os.path.join(objdir, obj), objdump)
        for size, align in cache[obj].get(sec, []):
            off = align_up(off, align) + size
    return off


def expand_marker(section, indent, generated_dir, objdir, objdump, cache,
                  claimed_regions):
    plan_path = os.path.join(generated_dir, f'{section}.plan.json')
    if not os.path.exists(plan_path):
        # No plan (e.g. section has no manifest entries): nothing to place;
        # the template's own `*(.sec)` wildcard handles it.
        return []
    with open(plan_path) as f:
        plan = json.load(f)
    wildcard = plan['wildcard']
    lines = []
    for item in plan['sequence']:
        t = item.get('type')
        if t == 'part':
            lines.append(f'{indent}{item["file"]}.o ({wildcard})\n')
        elif t == 'whole':
            # Single carved file, placed by the generic wildcard: emit nothing.
            pass
        elif t == 'island' and item['objs'][0][0].startswith('@'):
            # Linker-owned region (MWLD's own LITERAL/EXCEPTION pool). Its size
            # is only known at link time, so place the directive at the hole's
            # start and pad with an ABSOLUTE location-counter assignment. MWLD
            # rejects a backward `.` move, so an overflow of the retail span is
            # a hard link error rather than silent downstream drift.
            if len(item['objs']) != 1:
                raise SystemExit(
                    f'migrate: linker-region island in {section} has more than '
                    f'one provider: {item["objs"]!r}')
            directive = item['objs'][0][0][1:]
            end = item['end_addr']
            claimed_regions[directive] = (section, end - item['size'])
            lines.append(f'{indent}// auto: MWLD {directive} region placed into '
                         f'its retail hole at 0x{end - item["size"]:X}'
                         f'..0x{end:X} (asm/decompiled_symbols.txt)\n')
            lines.append(f'{indent}{directive}\n')
            lines.append(f'{indent}. = 0x{end:X};\n')
        elif t == 'island':
            objs = [(o, s) for o, s in item['objs']]
            for obj, sec in objs:
                lines.append(f'{indent}{obj} ({sec})\n')
            consumed = linker_consumed(objs, objdir, objdump, cache)
            pad = item['size'] - consumed
            if pad < 0:
                raise SystemExit(
                    f'migrate: island in {section} overflows its retail hole: '
                    f'objects consume 0x{consumed:X} but the hole is only '
                    f'0x{item["size"]:X} -- a migrated object grew larger than '
                    f'its hole; re-analyse the layout.')
            if pad > 0:
                lines.append(
                    f'{indent}// auto: pad island to its 0x{item["size"]:X}-byte '
                    f'retail span (objects consume 0x{consumed:X})\n')
                lines.append(f'{indent}. = . + 0x{pad:X};\n')
    return lines


def lcf_main(argv):
    ap = argparse.ArgumentParser(prog='migrate.py --lcf')
    ap.add_argument('template')
    ap.add_argument('generated_dir')
    ap.add_argument('objdir')
    ap.add_argument('out')
    ap.add_argument('--objdump', default=os.environ.get('OBJDUMP', 'objdump'))
    a = ap.parse_args(argv)

    cache = {}
    claimed_regions = {}
    out_lines = []
    with open(a.template) as f:
        for line in f:
            m = MARKER_RE.match(line)
            if m:
                indent, section = m.group(1), m.group(2)
                out_lines.extend(expand_marker(section, indent, a.generated_dir,
                                               a.objdir, a.objdump, cache,
                                               claimed_regions))
                continue
            d = DIRECTIVE_RE.match(line)
            if d and d.group(2) in claimed_regions:
                # This region was placed into a retail hole above; leave a
                # breadcrumb where the template used to emit it, so the
                # generated LCF still reads top-to-bottom.
                sec, start = claimed_regions[d.group(2)]
                out_lines.append(
                    f'{d.group(1)}// auto: {d.group(2)} moved into its {sec} '
                    f'hole at 0x{start:X} (asm/decompiled_symbols.txt)\n')
                continue
            out_lines.append(line)

    with open(a.out, 'w') as f:
        f.writelines(out_lines)
    return 0

if __name__ == '__main__':
    sys.exit(main())
