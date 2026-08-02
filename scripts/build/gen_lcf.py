#!/usr/bin/env python3
"""Generate build/SCUS_971.11.lcf from the hand-authored template by expanding
each

    // @MIGRATE <section>

marker into the explicit interleaved placement of that section's split parts
and migrated objects, as planned by scripts/build/migrate_section.py. The rest
of the template is copied verbatim. A marker whose section has no islands
expands to nothing, leaving the template's `*(.sec)` wildcard to place the
single carved file.

For each island, if the object sections and their alignment consume fewer bytes
than the island's retail span, the following raw part would shift, so an
explicit `. = . + 0xN;` closes the gap:

    pad = island_span - linker_consumed

where linker_consumed is what MWLD uses concatenating the object's sections of
that name, each rounded to its declared alignment (from `objdump -h`). A
negative pad means an object outgrew its hole, and fails loudly.

An island provided by `@DIRECTIVE` is filled by an MWLD region -- the
gp-relative literal pool, or the exception table -- whose size is known only at
link time. Those get the directive at the hole's start followed by an absolute
`. = <hole_end>;`; MWLD rejects a backward `.` move, so outgrowing the retail
span is a hard error rather than silent drift. Because the region is placed
here, DIRECTIVE_RE replaces its standalone occurrence later in the template
with a breadcrumb comment.

Usage:
    gen_lcf.py <template.lcf> <generated_dir> <objdir> <out.lcf> [--objdump BIN]
"""
import argparse
import json
import os
import re
import subprocess
import sys

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
                    f'gen_lcf: linker-region island in {section} has more than '
                    f'one provider: {item["objs"]!r}')
            directive = item['objs'][0][0][1:]
            end = item['end_addr']
            claimed_regions[directive] = (section, end - item['size'])
            lines.append(f'{indent}// auto: MWLD {directive} region placed into '
                         f'its retail hole at 0x{end - item["size"]:X}'
                         f'..0x{end:X} (asm/migrated_symbols.txt)\n')
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
                    f'gen_lcf: island in {section} overflows its retail hole: '
                    f'objects consume 0x{consumed:X} but the hole is only '
                    f'0x{item["size"]:X} -- a migrated object grew larger than '
                    f'its hole; re-analyse the layout.')
            if pad > 0:
                lines.append(
                    f'{indent}// auto: pad island to its 0x{item["size"]:X}-byte '
                    f'retail span (objects consume 0x{consumed:X})\n')
                lines.append(f'{indent}. = . + 0x{pad:X};\n')
    return lines


def main():
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('template')
    ap.add_argument('generated_dir')
    ap.add_argument('objdir')
    ap.add_argument('out')
    ap.add_argument('--objdump', default=os.environ.get('OBJDUMP', 'objdump'))
    a = ap.parse_args()

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
                    f'hole at 0x{start:X} (asm/migrated_symbols.txt)\n')
                continue
            out_lines.append(line)

    with open(a.out, 'w') as f:
        f.writelines(out_lines)
    return 0


if __name__ == '__main__':
    sys.exit(main())
