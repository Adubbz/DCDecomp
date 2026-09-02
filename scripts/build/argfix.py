#!/usr/bin/env python3
"""Pin the byte call lowering reads for one function, until it matches.

    argfix.py <source> <function> [--image title] [--radius 3] [--size 4]

Which of a call's float arguments is materialised first is a byte the compiler
reads and never wrote (re/ai/compiler/leaked_state.md). `constant_flag` sets it
per float constant, which cannot separate arguments that are the *same*
constant; this sets it per *read* instead, which can.

Three steps, all measured rather than guessed:

1. Take the compiler's own residue at every read and pin it. That reproduces
   what the unit already builds, and makes it reproducible.
2. Toggle each read in turn and record which instructions of the target
   function move. A read that changes nothing on its own can still matter in
   company, so what is kept is the *window* around the ones that do.
3. The function's wrong instructions cluster by call site. For each cluster,
   search the window of reads that touch it until the cluster is clean.

What it prints is the `#pragma argument_flag_ones` block the source needs.
"""

import argparse
import itertools
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import quicktu  # noqa: E402

sys.stdout.reconfigure(line_buffering=True)


def object_symbol(source, function):
    """What the object calls a function retail's image knows by another name."""
    fixups = json.load(open(os.path.join(quicktu.REPO,
                                         'config/object_fixups.json')))
    renames = fixups.get(source, {}).get('symbols', {})
    for spelt, retail in renames.items():
        if retail == function:
            return spelt
    return function


def rows(source, function, image, ones, symbol=None):
    """The target's instructions, retail's beside ours, one row per pair."""
    obj, log, stem = quicktu.compile_unit(
        source, [], argones=sorted(ones), argflag=0)
    try:
        theirs = quicktu.retail_function(image, function)
        mine = quicktu.ours(obj, (symbol or function).replace(stem[1], stem[0]))
        out = []
        for i in range(max(len(theirs), len(mine))):
            masked = mine[i][1] if i < len(mine) else False
            a = quicktu.shape(theirs[i], masked) if i < len(theirs) else ''
            b = quicktu.shape(mine[i][0], masked) if i < len(mine) else ''
            out.append((a, b))
        return out
    finally:
        if os.path.exists(obj):
            os.unlink(obj)


def residue(source):
    """{index: byte} for every read, as the compiler's own arena leaves it."""
    obj, log, _stem = quicktu.compile_unit(source, [], verify=True, arghook=True)
    if os.path.exists(obj):
        os.unlink(obj)
    found = {}
    for line in log.splitlines():
        parts = line.split()
        if len(parts) > 4 and parts[:2] == ['statefix:', 'argument']:
            # `... argument N <name> [kind XX at ADDR] WAS -> WANT`
            found[int(parts[2])] = int(parts[parts.index('->') - 1], 16)
    return found


def clusters(bad):
    """Wrong rows grouped by the call they belong to."""
    groups, run = [], []
    for row in bad:
        if run and row - run[-1] > 6:
            groups.append(run)
            run = []
        run.append(row)
    if run:
        groups.append(run)
    return groups


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('source')
    parser.add_argument('function')
    parser.add_argument('--image', default='title')
    parser.add_argument('--radius', type=int, default=3)
    parser.add_argument('--from', dest='start', type=int, default=1,
                        help='first read to scan; the rest are left as they are')
    parser.add_argument('--to', dest='stop', type=int, default=0,
                        help='last read to scan, 0 for all of them')
    parser.add_argument('--size', type=int, default=4)
    parser.add_argument('--ones', default='')
    args = parser.parse_args()

    seed = residue(args.source)
    ones = {i for i, was in seed.items() if was}
    ones |= {int(i, 0) for i in args.ones.replace(',', ' ').split()}
    symbol = object_symbol(args.source, args.function)
    base = rows(args.source, args.function, args.image, ones, symbol)
    bad = [i for i, (a, b) in enumerate(base) if a != b]
    print('%d reads, %d pinned, %d instructions differ' % (len(seed), len(ones), len(bad)))
    if not bad:
        return

    window = [i for i in sorted(seed)
              if i >= args.start and (not args.stop or i <= args.stop)]
    print('scanning %d of %d reads' % (len(window), len(seed)))
    touches = {}
    for index in window:
        got = rows(args.source, args.function, args.image,
                   set(ones) ^ {index}, symbol)
        if got != base:
            moved = [i for i in range(min(len(base), len(got))) if base[i] != got[i]]
            touches[index] = moved
            print('  read %-4d moves rows %s' % (index, moved[:6]))

    for group in clusters(bad):
        hits = [i for i, moved in touches.items()
                if any(r in group for r in moved)]
        if not hits:
            print('cluster %s: no read reaches it' % group)
            continue
        window = [i for i in sorted(seed)
                  if min(hits) - args.radius <= i <= max(hits) + args.radius]
        print('cluster %s: window %d..%d' % (group, window[0], window[-1]))
        found = None
        for size in range(1, args.size + 1):
            for combination in itertools.combinations(window, size):
                trial = set(ones) ^ set(combination)
                got = rows(args.source, args.function, args.image, trial, symbol)
                if len(got) == len(base) and all(got[r][0] == got[r][1] for r in group):
                    found = trial
                    print('  fixed by %s' % (combination,))
                    break
            if found:
                break
        if found:
            ones = found
            base = rows(args.source, args.function, args.image, ones, symbol)

    left = [i for i, (a, b) in enumerate(base) if a != b]
    print('remaining %d' % len(left))
    order = sorted(ones)
    print('#pragma argument_flag 0')
    for at in range(0, len(order), 10):
        print('#pragma argument_flag_ones %s'
              % ','.join(str(i) for i in order[at:at + 10]))


if __name__ == '__main__':
    main()
