#!/usr/bin/env python3
"""Generate exact floating ExpressionNode identities for the whole game.

The retail side scans every split function for literal-pool loads and immediate
LUI/MTC1 materialisations. The live side compiles every game C++ translation
unit and records the identity directly at MWCC's kind-0x33 annotation escape at
0x004B290D. Live records are authoritative because optimized-away constants do
not necessarily leave an instruction in retail, while one expression can also
produce more than one machine-level use.

The output is consumed by statefix.py. All newly discovered nodes default to
evaluate_first=0. Existing entries retain their adjusted values, and legacy
constant_flag pragmas are imported while migrating away from them.
"""

import argparse
import bisect
import json
import math
import os
import re
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, HERE)

import disassemble  # noqa: E402
import literals  # noqa: E402
import quicktu  # noqa: E402

DEFAULT_OUTPUT = os.path.join(REPO, 'config', 'expression_node_overrides.json')
LEGACY_FLAG = re.compile(r'^\s*#\s*pragma\s+constant_flag\s+([01])\b', re.M)
LEGACY_ONES = re.compile(
    r'^\s*#\s*pragma\s+constant_flag_ones\s+([^\r\n/]*)', re.M)


def exact_value_text(value_type, bits):
    """Render IEEE bits without losing a negative zero or NaN's sign."""
    size = 4 if value_type == 'binary32' else 8
    value = struct.unpack('<f' if size == 4 else '<d',
                          bits.to_bytes(size, 'little'))[0]
    if math.isnan(value):
        sign = '-' if bits >> (size * 8 - 1) else '+'
        return '%snan(%#0*x)' % (sign, size * 2 + 2, bits)
    if math.isinf(value):
        return '-inf' if value < 0 else '+inf'
    return value.hex()


def identity(row):
    return (row['translation_unit'], row['function'], row['type'],
            int(row['value_bits'], 16), int(row['ordinal']))


def make_row(unit, function, value_type, bits, ordinal, flag=0):
    width = 8 if value_type == 'binary32' else 16
    return {
        'translation_unit': unit,
        'function': function,
        'type': value_type,
        'value': exact_value_text(value_type, bits),
        'value_bits': '0x%0*x' % (width, bits),
        'ordinal': ordinal,
        'evaluate_first': flag,
    }


def document_rows(document):
    """Expand either config schema into the generator's flat row form."""
    if document.get('version') == 1:
        return list(document.get('nodes', []))
    if document.get('version') != 2:
        raise ValueError('unsupported expression-node override version')
    rows = []
    translation_units = document.get('translation_units', {})
    if not isinstance(translation_units, dict):
        raise ValueError('translation_units must be an object')
    for unit, functions in translation_units.items():
        if not isinstance(functions, dict):
            raise ValueError('%s must contain a function object' % unit)
        for function, nodes in functions.items():
            if not isinstance(nodes, list):
                raise ValueError('%s/%s must contain a node list'
                                 % (unit, function))
            for node in nodes:
                rows.append(dict(node, translation_unit=unit,
                                 function=function))
    return rows


def make_document(rows, description=None):
    """Group flat rows by translation unit and function for serialization."""
    translation_units = {}
    for row in sorted(rows, key=identity):
        node = {key: value for key, value in row.items()
                if key not in ('translation_unit', 'function')}
        translation_units.setdefault(row['translation_unit'], {}).setdefault(
            row['function'], []).append(node)
    return {
        'version': 2,
        'description': description or (
            'Exact floating ExpressionNode identities grouped by translation '
            'unit and function. value_bits is authoritative and preserves sign.'),
        'translation_units': translation_units,
    }


def placements(root):
    """Return placement spans per linker text section."""
    with open(os.path.join(root, literals.LCF), encoding='utf-8') as f:
        found = literals.PLACEMENT.findall(f.read())
    by_section = {}
    for name, section, address in found:
        by_section.setdefault(section, []).append((int(address, 16), name))
    out = {}
    for section, entries in by_section.items():
        entries.sort()
        out[section] = [
            (start, entries[i + 1][0] if i + 1 < len(entries) else None, name)
            for i, (start, name) in enumerate(entries)
        ]
    return out


def function_section(path):
    normalized = path.replace('\\', '/')
    if '/title/' in normalized:
        return '.ttext'
    if '/dun/' in normalized:
        return '.dtext'
    return '.text'


def owner_for(path, address, spans):
    rows = spans.get(function_section(path), ())
    starts = [row[0] for row in rows]
    at = bisect.bisect_right(starts, address) - 1
    if at < 0:
        return None
    start, end, name = rows[at]
    return name if end is None or address < end else None


def compiler_name(source, retail_name, fixups):
    """Map splat's duplicate/retail spelling back to MWCC's live link name."""
    renames = fixups.get(source, {}).get('symbols', {}) if source else {}
    for compiled, retail in renames.items():
        if retail == retail_name:
            return compiled
    return literals.SUFFIX.sub('', retail_name)


def function_words(root, entry):
    path, _vram, _size = entry
    rows = []
    try:
        with open(os.path.join(root, path), encoding='utf-8') as f:
            for line in f:
                match = literals.DUMP_RE.match(line)
                if match:
                    rows.append((int(match.group(1), 16),
                                 int.from_bytes(bytes.fromhex(match.group(2)),
                                                'little')))
    except OSError:
        pass
    return rows


def writes_gpr(word, register):
    """Conservatively recognize a nearby instruction redefining a GPR."""
    opcode = word >> 26
    if opcode == 0:
        function = word & 0x3f
        # Shifts, arithmetic and logical SPECIAL operations write rd; control,
        # multiply/divide and HI/LO transfers without rd do not.
        return function not in (8, 9, 12, 13, 24, 25, 26, 27) and (
            (word >> 11) & 0x1f) == register
    # Immediate arithmetic/logical operations and integer loads write rt.
    if opcode in set(range(8, 16)) | set(range(32, 40)) | {26, 27, 48, 52, 55}:
        return ((word >> 16) & 0x1f) == register
    return opcode == 3 and register == 31


def immediate_float_sites(words):
    """Find direct binary32 LUI/MTC1 constants, including signed zero."""
    sites = []
    for i, (address, word) in enumerate(words):
        # mtc1 rt,fs is COP1 with rs=4. The source GPR is bits 20..16.
        if word >> 26 != 0x11 or (word >> 21) & 0x1f != 4:
            continue
        register = (word >> 16) & 0x1f
        if register == 0:
            sites.append((address, 0))
            continue
        # MWCC's simple float form is normally an adjacent LUI, with an
        # occasional scheduling instruction or nop between it and MTC1.
        for _prior_address, prior in reversed(words[max(0, i - 4):i]):
            if prior >> 26 == 0x0f and (prior >> 16) & 0x1f == register:
                sites.append((address, (prior & 0xffff) << 16))
                break
            if writes_gpr(prior, register):
                break
    return sites


def retail_rows(root):
    """Inventory floating constants visible in every retail function dump."""
    retail = literals.Retail(root)
    spans = placements(root)
    units = {}
    for _kind, _image, source, _reference in disassemble.read_units(
            os.path.join(root, 'config'), os.path.join(root, 'src')):
        source = os.path.relpath(source, root)
        units[os.path.basename(source)] = source
    with open(os.path.join(root, 'config', 'object_fixups.json'),
              encoding='utf-8') as f:
        fixups = json.load(f)

    found = {}
    by_name, _by_address = retail.functions
    for retail_name, entry in by_name.items():
        path, address, _size = entry
        obj = owner_for(path, address, spans)
        if obj is None:
            continue
        source = units.get(obj)
        unit = os.path.basename(source) if source else obj
        function = compiler_name(source, retail_name, fixups)
        candidates = []
        for offset, _pool_address, value in retail.function_loads(retail_name):
            value_type = 'binary32' if len(value) == 4 else 'binary64'
            candidates.append((address + offset, value_type,
                               int.from_bytes(value, 'little')))
        for site, bits in immediate_float_sites(function_words(root, entry)):
            candidates.append((site, 'binary32', bits))
        occurrences = {}
        for _site, value_type, bits in sorted(candidates):
            base = (unit, function, value_type, bits)
            ordinal = occurrences.get(base, 0) + 1
            occurrences[base] = ordinal
            row = make_row(unit, function, value_type, bits, ordinal)
            found.setdefault(identity(row), row)
    return found


def legacy_values(source, legacy_ref=None):
    if legacy_ref:
        done = subprocess.run(['git', 'show', '%s:%s' % (legacy_ref, source)],
                              cwd=REPO, capture_output=True, text=True)
        text = done.stdout if done.returncode == 0 else ''
    else:
        text = open(os.path.join(REPO, source), encoding='utf-8').read()
    standing = LEGACY_FLAG.search(text)
    default = int(standing.group(1)) if standing else 0
    ones = set()
    for match in LEGACY_ONES.finditer(text):
        for item in match.group(1).replace(',', ' ').split():
            ones.add(int(item, 0))
    return default, ones


def live_rows(root, legacy_ref=None):
    """Compile every game C++ unit and read identities from MWCC memory."""
    found = {}
    for kind, _image, source, _reference in disassemble.read_units(
            os.path.join(root, 'config'), os.path.join(root, 'src')):
        source = os.path.relpath(source, root)
        if kind != 'mixed' or not source.endswith('.cpp') or source.startswith('src/lib/'):
            continue
        default, legacy_ones = legacy_values(source, legacy_ref)
        obj, log, _stem = quicktu.compile_unit(source, [], verify=True)
        try:
            index = 0
            for line in log.splitlines():
                marker = 'statefix: expression-node '
                if marker not in line:
                    continue
                index += 1
                event = json.loads(line.split(marker, 1)[1])
                bits = int(event['value_bits'], 16)
                flag = 1 if index in legacy_ones else default
                row = make_row(event['translation_unit'], event['function'],
                               event['type'], bits, event['ordinal'], flag)
                found[identity(row)] = row
        finally:
            if os.path.exists(obj):
                os.unlink(obj)
    return found


def existing_rows(path):
    try:
        with open(path, encoding='utf-8') as f:
            document = json.load(f)
    except FileNotFoundError:
        return {}
    try:
        return {identity(row): row for row in document_rows(document)}
    except (TypeError, ValueError) as error:
        raise SystemExit('%s: %s' % (path, error))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default=DEFAULT_OUTPUT)
    parser.add_argument('--retail-only', action='store_true',
                        help='skip live MWCC enumeration of decompiled C++')
    parser.add_argument('--fresh', action='store_true',
                        help='do not retain adjusted values from an existing file')
    parser.add_argument('--legacy-ref',
                        help='import removed constant pragmas from this git revision')
    args = parser.parse_args()

    rows = retail_rows(REPO)
    retail_count = len(rows)
    live = {} if args.retail_only else live_rows(REPO, args.legacy_ref)
    rows.update(live)
    if not args.fresh:
        for key, old in existing_rows(args.output).items():
            if key in rows:
                rows[key]['evaluate_first'] = int(old['evaluate_first'])

    ordered = sorted(rows.values(), key=identity)
    document = make_document(ordered)
    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
    with open(args.output, 'w', encoding='utf-8') as f:
        json.dump(document, f, indent=2)
        f.write('\n')
    print('%s: %d retail identities, %d live identities, %d total'
          % (os.path.relpath(args.output, REPO), retail_count,
             len(live), len(ordered)))


if __name__ == '__main__':
    main()
