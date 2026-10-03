#!/usr/bin/env python3
"""Record a unit's argument reads as per-function overrides.

    argument_read_overrides.py <source> [--from <file>] [--write]
    argument_read_overrides.py <source> --search <function> [--depth 3] [--write]
    argument_read_overrides.py <source> --remove

Call lowering decides which operand of a call or a binary node to materialise
first from one byte of the operand's ExpressionNode, and for many nodes that
byte is whatever the compiler's arena last held (re/ai/compiler/leaked_state.md).
`#pragma argument_flag*` pins it by the read's index across the whole unit,
which shifts every time any function's body changes. This records the byte
each read takes instead -- under whatever pragmas, overrides or residue the
source compiles with now -- keyed by the function being compiled and the read's
position within that function, whatever kind of expression it reads.

`--write` stores the unit's reads in `ps2/config/<region>/argument_read_overrides.json`,
which makes the unit read-keyed: statefix then gives each listed read its byte
and every other read 0. Once a unit is recorded, remove its
`#pragma argument_flag`, `argument_flag_ones` and `argument_flag_free` lines,
which would otherwise still win by index, and rebuild to confirm the object has
not changed.

`--from` compiles another file's text under the source's identity, for
recording from a copy.

`--search` starts from the unit's current bytes and flips reads of one
function, scoring each compile against retail word for word -- branch targets
included, relocated words skipped -- until the function matches. Flips of one
function never move another's reads, so each candidate costs one compile and
nothing else in the unit needs rechecking. With `--write` the matching bytes
are stored.
"""

import argparse
import concurrent.futures
import itertools
import json
import os
import re
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, HERE)
import quicktu  # noqa: E402
import region  # noqa: E402
import retail  # noqa: E402

STATEFIX = os.environ.get('STATEFIX_SCRIPT', os.path.join(HERE, 'statefix.py'))
OUTPUT = os.environ.get(
    'ARGUMENT_READ_OVERRIDES',
    os.path.join(REPO, region.CONFIG, 'argument_read_overrides.json'))


def record(source, text):
    """[read event] for every argument read of `text` compiled as `source`."""
    directory = os.path.join(REPO, os.path.dirname(source))
    handle, temporary = tempfile.mkstemp(suffix='.cpp', prefix='tmpquick_',
                                         dir=directory)
    os.close(handle)
    obj = temporary[:-4] + '.o'
    try:
        with open(temporary, 'w') as f:
            f.write(text)
        command = [sys.executable, STATEFIX, '--verify', '--',
                   '-o', os.path.relpath(obj, REPO)] + quicktu.FLAGS
        command.append(os.path.relpath(temporary, REPO))
        environment = dict(os.environ, STATEFIX_SOURCE=source)
        # Recording must see the source's own state, not an older recording.
        environment['ARGUMENT_READ_OVERRIDES'] = os.path.join(
            REPO, 'build', 'no-argument-read-overrides.json')
        done = subprocess.run(command, cwd=REPO, env=environment,
                              capture_output=True, text=True)
        if done.returncode or not os.path.exists(obj):
            raise SystemExit('%s: compile failed\n%s'
                             % (source, (done.stdout + done.stderr)[-2000:]))
    finally:
        for path in (temporary, obj):
            if os.path.exists(path):
                os.unlink(path)
    events = []
    for line in (done.stdout + done.stderr).splitlines():
        if line.startswith('statefix: read '):
            events.append(json.loads(line[len('statefix: read '):]))
    if not events:
        raise SystemExit('%s: the compile reported no argument reads' % source)
    return events


def table_of(events, unit):
    """{function: {ordinal: (kind, byte)}} of the reads that take 1."""
    table = {}
    for event in events:
        if event['function'] is None or event['ordinal'] is None:
            raise SystemExit('%s: read %d has no function' % (unit, event['index']))
        if event['evaluate_first']:
            table.setdefault(event['function'], {})[event['ordinal']] = (
                event['kind'], 1)
    return table


def rows_of(table):
    return {function: [{'ordinal': ordinal, 'kind': kind, 'evaluate_first': flag}
                       for ordinal, (kind, flag) in sorted(reads.items())]
            for function, reads in sorted(table.items()) if reads}


def compile_keyed(source, text, unit, table, obj):
    """Compile `text` as `source` with `table` as the unit's read overrides."""
    directory = os.path.join(REPO, os.path.dirname(source))
    handle, temporary = tempfile.mkstemp(suffix='.cpp', prefix='tmpquick_',
                                         dir=directory)
    os.close(handle)
    handle, overrides = tempfile.mkstemp(suffix='.json', prefix='reads_',
                                         dir=os.path.join(REPO, 'build'))
    os.close(handle)
    try:
        with open(temporary, 'w') as f:
            f.write(text)
        with open(overrides, 'w') as f:
            json.dump({'version': 1,
                       'translation_units': {unit: rows_of(table)}}, f)
        command = [sys.executable, STATEFIX, '--', '-o',
                   os.path.relpath(obj, REPO)] + quicktu.FLAGS
        command.append(os.path.relpath(temporary, REPO))
        environment = dict(os.environ, STATEFIX_SOURCE=source,
                           ARGUMENT_READ_OVERRIDES=overrides)
        subprocess.run(command, cwd=REPO, env=environment,
                       capture_output=True, text=True)
        return os.path.basename(temporary)[:-4]
    finally:
        os.unlink(temporary)
        os.unlink(overrides)


def object_words(obj, symbol):
    """[(word, relocated)] of one function of an object."""
    text = subprocess.run(
        [quicktu.PREFIX + 'objdump', '-dr', '-z', '-EL', '-m', 'mips:5900',
         '--disassemble=' + symbol, obj], capture_output=True, text=True).stdout
    words, taking = [], False
    for line in text.splitlines():
        head = re.match(r'^[0-9a-f]+ <(.+)>:$', line)
        if head:
            taking = head.group(1) == symbol
            continue
        if not taking:
            continue
        word = re.match(r'^\s*[0-9a-f]+:\s+([0-9a-f]{8})\s', line)
        if word:
            words.append([int(word.group(1), 16), False])
        elif re.match(r'^\s+[0-9a-f]+:\s+R_MIPS', line) and words:
            words[-1][1] = True
    return words


def retail_words(image, function):
    """The function's words in retail's image."""
    _path, symbols, _base = quicktu.IMAGES[image]
    want = re.compile(re.escape(function) + r' = 0x([0-9a-fA-F]+);.*size:0x([0-9a-fA-F]+)')
    for line in open(os.path.join(REPO, symbols)):
        found = want.match(line)
        # main's table also lists the overlays' functions, as absolute.
        if found and (image != 'main' or 'absolute:True' not in line):
            address, size = int(found.group(1), 16), int(found.group(2), 16)
            blob = retail.read(image, address, size)
            return [int.from_bytes(blob[i:i + 4], 'little')
                    for i in range(0, size, 4)]
    raise SystemExit('%s: not in %s' % (function, symbols))


def search(source, text, unit, function, image, depth, jobs):
    """The unit's table with `function`'s reads set to match retail, or None."""
    events = record(source, text)
    base = table_of(events, unit)
    ordinals = sorted(e['ordinal'] for e in events if e['function'] == function)
    kinds = {e['ordinal']: e['kind'] for e in events if e['function'] == function}
    if not ordinals:
        raise SystemExit('%s: no argument reads in %s' % (unit, function))
    theirs = retail_words(image, function)
    symbol = object_symbol(source, function)
    workdir = tempfile.mkdtemp(prefix='readsearch_', dir=os.path.join(REPO, 'build'))

    def score(flips):
        table = {name: dict(reads) for name, reads in base.items()}
        mine = table.setdefault(function, {})
        for ordinal in flips:
            if ordinal in mine:
                del mine[ordinal]
            else:
                mine[ordinal] = (kinds[ordinal], 1)
        obj = os.path.join(workdir, '%s.o' % '_'.join(map(str, flips)) or 'base')
        stem = compile_keyed(source, text, unit, table, obj)
        if not os.path.exists(obj):
            return None, table
        # The static initialiser is named after the file the compiler read.
        if symbol.startswith('__sinit_'):
            symbol_now = '__sinit_%s.cpp' % stem
        else:
            symbol_now = symbol
        ours = object_words(obj, symbol_now)
        os.unlink(obj)
        if not ours:
            return None, table
        bad = abs(len(ours) - len(theirs)) * 4
        for (word, relocated), retail_word in zip(ours, theirs):
            bad += not relocated and word != retail_word
        return bad, table

    try:
        best, table = score(())
        print('%s: %d reads, %d words differ as recorded'
              % (function, len(ordinals), best))
        if best == 0:
            return table
        with concurrent.futures.ThreadPoolExecutor(jobs) as pool:
            for size in range(1, depth + 1):
                candidates = list(itertools.combinations(ordinals, size))
                results = list(pool.map(score, candidates))
                ranked = sorted((r[0], c) for c, r in zip(candidates, results)
                                if r[0] is not None)
                if ranked:
                    print('  %d flips: best %d %s'
                          % (size, ranked[0][0], list(ranked[0][1])))
                for flips, result in zip(candidates, results):
                    if result[0] == 0:
                        print('  match flipping %s' % list(flips))
                        return result[1]
        return None
    finally:
        for name in os.listdir(workdir):
            os.unlink(os.path.join(workdir, name))
        os.rmdir(workdir)


def object_symbol(source, function):
    """What the object calls a function the image knows by another name."""
    fixups = json.load(open(os.path.join(REPO, region.CONFIG, 'object_fixups.json')))
    for spelt, name in fixups.get(source, {}).get('symbols', {}).items():
        if name == function:
            return spelt
    return function


def load():
    try:
        with open(OUTPUT, encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        return {'version': 1, 'translation_units': {}}


def save(document):
    document['translation_units'] = dict(
        sorted(document['translation_units'].items()))
    with open(OUTPUT, 'w', encoding='utf-8') as f:
        json.dump(document, f, indent=1)
        f.write('\n')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('source')
    parser.add_argument('--from', dest='body')
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--remove', action='store_true')
    parser.add_argument('--search', metavar='FUNCTION')
    parser.add_argument('--image', choices=('main', 'title', 'dun'))
    parser.add_argument('--depth', type=int, default=3)
    parser.add_argument('--jobs', type=int, default=os.cpu_count() or 4)
    args = parser.parse_args()
    unit = os.path.basename(args.source)

    if args.search:
        image = args.image or ('title' if args.source.startswith('ps2/src/title/')
                               else 'dun' if args.source.startswith('ps2/src/dun/')
                               else 'main')
        text = open(os.path.join(REPO, args.body or args.source)).read()
        table = search(args.source, text, unit, args.search, image,
                       args.depth, args.jobs)
        if table is None:
            raise SystemExit('%s: no match within %d flips' % (args.search, args.depth))
        if args.write:
            document = load()
            document['translation_units'][unit] = rows_of(table)
            save(document)
            print('wrote %s' % os.path.relpath(OUTPUT, REPO))
        return

    if args.remove:
        document = load()
        document['translation_units'].pop(unit, None)
        save(document)
        print('%s: removed from %s' % (unit, os.path.relpath(OUTPUT, REPO)))
        return

    text = open(os.path.join(REPO, args.body or args.source)).read()
    events = record(args.source, text)
    functions = {}
    unattributed = 0
    for event in events:
        if event['function'] is None or event['ordinal'] is None:
            unattributed += 1
            continue
        if event['translation_unit'] != unit:
            raise SystemExit('%s: read %d attributed to unit %s'
                             % (unit, event['index'], event['translation_unit']))
        reads = functions.setdefault(event['function'], [])
        # The compiler tests the byte against zero and nothing else.
        if event['evaluate_first']:
            reads.append({'ordinal': event['ordinal'], 'kind': event['kind'],
                          'evaluate_first': 1})
    if unattributed:
        raise SystemExit('%s: %d reads have no function' % (unit, unattributed))
    table = {name: reads for name, reads in sorted(functions.items()) if reads}
    ones = sum(len(reads) for reads in table.values())
    print('%s: %d reads in %d functions, %d read 1'
          % (unit, len(events), len(functions), ones))
    if args.write:
        document = load()
        document['translation_units'][unit] = table
        save(document)
        print('wrote %s' % os.path.relpath(OUTPUT, REPO))


if __name__ == '__main__':
    main()
