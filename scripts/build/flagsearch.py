#!/usr/bin/env python3
"""Search retail's constant-flag decisions for one translation unit.

    flagsearch.py <source> [--image title] [--flag 0]

The byte that decides which of a call's float arguments is materialised first
is leaked compiler state: retail's compiler read whatever its arena held, one
read per float constant, and the only witness is retail's own instruction
stream (re/ai/compiler/leaked_state.md). This searches it.

The unit is compiled under `#pragma constant_flag <flag>`, which makes the
compile deterministic, and then the constants that have to read the other value
are found by coordinate descent: each is toggled in turn, the whole unit is
scored against retail with `quicktu.py`, and the toggle that helps most is
kept. Only the constants of a function that is still wrong are tried, so a unit
whose functions already match costs one compile.

What it prints is the `#pragma constant_flag_ones` line the source needs.
"""

import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import quicktu  # noqa: E402

sys.stdout.reconfigure(line_buffering=True)


def measure(source, ones, flag, image, ignore=(), shapes=None,
            axis='constant', fixed=()):
    """{function: differing instructions} for the whole unit, and the total.

    `shapes`, when given, is filled in with each function's instructions as
    compiled -- what says whether a constant reached a function at all, which a
    count of differences cannot: two orders can be equally wrong.
    """
    if axis == 'constant':
        obj, log, stem = quicktu.compile_unit(
            source, sorted(ones), flag=flag, argones=sorted(fixed),
            argflag=0 if fixed else None)
    else:
        obj, log, stem = quicktu.compile_unit(
            source, sorted(fixed), flag=0 if fixed else None,
            argones=sorted(ones), argflag=flag)
    try:
        names = quicktu.retail_names(source, [
            quicktu.unhide(n, stem) for n in quicktu.object_functions(obj)])
        out = {}
        for symbol, name in names.items():
            symbol = symbol.replace(stem[1], stem[0])
            try:
                theirs = quicktu.retail_function(image, name)
            except SystemExit:
                continue
            mine = quicktu.ours(obj, symbol)
            if mine and name not in ignore:
                out[name] = quicktu.compare(theirs, mine)
                if shapes is not None:
                    # The instructions as they came out, immediates and all: two
                    # orders of the same constants mask to the same shape, and
                    # telling them apart is the whole point here. The symbol
                    # objdump names beside a call goes -- it carries the
                    # temporary file's name, which changes every compile.
                    shapes[name] = tuple(re.sub(r'\s*<[^>]*>', '', text)
                                         for text, _ in mine)
        return out, sum(out.values())
    finally:
        if os.path.exists(obj):
            os.unlink(obj)


def node_report(source, flag=None, axis='constant'):
    """{index: (function, residue)} for every decision on the chosen axis."""
    if axis == 'constant':
        obj, log, _stem = quicktu.compile_unit(source, [], verify=True, flag=flag)
        head, at = ['statefix:', 'node'], 5
    else:
        # The hook has to be asked for even with nothing to say: standing at
        # the read is what counts and reports them, and `argflag` stays unset so
        # the compile is the compiler's own.
        obj, log, _stem = quicktu.compile_unit(
            source, [], verify=True, arghook=True)
        head, at = ['statefix:', 'argument'], None
    if os.path.exists(obj):
        os.unlink(obj)
    found = {}
    for line in log.splitlines():
        parts = line.split()
        if parts[:2] == head and (at is None or len(parts) > at):
            # the argument line carries the node's kind and address too, so the
            # residue is the field just before the arrow
            where = at if at is not None else parts.index('->') - 1
            found[int(parts[2])] = (parts[3], int(parts[where], 16))
    return found


def near(owners, scores):
    """The constants worth toggling for the functions that are still wrong.

    A constant only decides the order inside the function it stands in, but the
    name it is reported under is the one the *parser* had reached, which runs a
    function ahead of the annotation pass. So a wrong function's constants are
    in its own reported group or in the one on either side of it.
    """
    order, seen = [], set()
    for index in sorted(owners):
        if owners[index] not in seen:
            seen.add(owners[index])
            order.append(owners[index])
    wrong = {name.split('__F')[0] for name, bad in scores.items() if bad}
    want = set()
    for i, name in enumerate(order):
        if name in wrong:
            want.update(order[max(0, i - 1):i + 2])
    want.add('?')
    return [i for i in sorted(owners) if owners[i] in want]


def owns(source, name, nodes, ones, flag, image, ignore, was,
         axis='constant', fixed=()):
    """Which of the unit's constants decide the shape of one function.

    Toggling a set of constants either changes that function or it does not, so
    the ones that reach it can be bisected out rather than guessed at from the
    name the annotation pass reported -- which is the function the parser had
    got to, not the one the constant stands in.
    """
    found = []
    for index in nodes:
        shapes = {}
        measure(source, set(ones) ^ {index}, flag, image, ignore, shapes,
                axis, fixed)
        if shapes.get(name) != was:
            found.append(index)
    return found


def subsets(ones, nodes, limit):
    """Ways of setting those constants, fewest changed first.

    Exhaustive while that is affordable: `limit` caps how many compiles one
    function is worth, and a dozen constants is 4095 of them.
    """
    import itertools
    if 2 ** len(nodes) <= limit:
        sizes = range(1, len(nodes) + 1)
    else:
        sizes = [size for size in range(1, 4) if len(nodes) ** size <= limit]
    for size in sizes:
        for group in itertools.combinations(nodes, size):
            yield set(ones) ^ set(group)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('source')
    parser.add_argument('--image', default='title')
    parser.add_argument('--flag', type=int, default=0)
    parser.add_argument('--ones', default='')
    parser.add_argument('--passes', type=int, default=4)
    parser.add_argument('--rounds', type=int, default=4,
                        help='how many times to repeat descent and the exact phase')
    parser.add_argument('--window', default='',
                        help='lo:hi -- only these constants, for the pair phase')
    parser.add_argument('--axis', default='constant',
                        choices=('constant', 'argument'),
                        help='the float constants of the unit, or the reads call '
                             'lowering makes of their evaluate-first byte')
    parser.add_argument('--fixed', default='',
                        help='the other axis, held at what the search settled on')
    parser.add_argument('--ignore', default='',
                        help='functions to leave out of the score')
    parser.add_argument('--wide', action='store_true',
                        help='try every constant, not just the ones near a wrong function')
    parser.add_argument('--seed', action='store_true',
                        help="start from the compiler's own residue")
    parser.add_argument('--exact', action='store_true',
                        help='bisect out which constants reach each wrong function')
    parser.add_argument('--limit', type=int, default=20000,
                        help='the most combinations to try for one function')
    parser.add_argument('--pairs', action='store_true',
                        help='when single toggles stall, try them two at a time')
    args = parser.parse_args()

    owners = {i: name for i, (name, _)
              in node_report(args.source, args.flag, args.axis).items()}
    if not owners:
        raise SystemExit('%s: no float constants' % args.source)
    ones = {int(i, 0) for i in args.ones.replace(',', ' ').split()}
    if args.seed:
        # The compiler's own residue is where to start: it is what the build
        # has been getting, so it already has whatever the unit matches under.
        ones |= {i for i, (_, was)
                 in node_report(args.source, axis=args.axis).items() if was}
    ignore = set(args.ignore.replace(',', ' ').split())
    fixed = {int(i, 0) for i in args.fixed.replace(',', ' ').split()}
    scores, best = measure(args.source, ones, args.flag, args.image, ignore,
                           axis=args.axis, fixed=fixed)
    print('start %d  %s' % (best, ' '.join(
        '%s=%d' % (k, v) for k, v in sorted(scores.items()) if v)))

    for _outer in range(args.rounds):
      before = best
      for _round in range(args.passes):
        candidates = sorted(owners) if args.wide else near(owners, scores)
        print('  pass %d: %d constants to try' % (_round + 1, len(candidates)))
        moved = False
        for index in candidates:
            trial = set(ones) ^ {index}
            got, total = measure(args.source, trial, args.flag, args.image,
                                 ignore, axis=args.axis, fixed=fixed)
            if total < best:
                ones, scores, best, moved = trial, got, total, True
                print('  node %-4d -> %d  %s' % (index, best, ' '.join(
                    '%s=%d' % (k, v) for k, v in sorted(scores.items()) if v)))
                if not best:
                    break
        if not moved or not best:
            break

      if args.exact and best:
        for name in [n for n, bad in sorted(scores.items()) if bad]:
            shapes = {}
            measure(args.source, ones, args.flag, args.image, ignore, shapes,
                    args.axis, fixed)
            mine = owns(args.source, name, sorted(owners), ones, args.flag,
                        args.image, ignore, shapes.get(name), args.axis, fixed)
            print('  %s: constants %s' % (name, mine or 'none found'))
            if not mine:
                continue
            for trial in subsets(ones, mine, args.limit):
                got, total = measure(args.source, trial, args.flag, args.image,
                                     ignore, axis=args.axis, fixed=fixed)
                if total < best:
                    ones, scores, best = trial, got, total
                    print('    -> %d  %s' % (best, ' '.join(
                        '%s=%d' % (k, v) for k, v in sorted(scores.items()) if v)))
                    if not got.get(name):
                        break

      if best >= before or not best:
          break

      if args.pairs and best:
        lo, _, hi = args.window.partition(':')
        window = [i for i in (sorted(owners) if (args.wide or args.window)
                              else near(owners, scores))
                  if (not lo or int(lo) <= i) and (not hi or i <= int(hi))]
        print('  pairs: %d constants, %d combinations'
              % (len(window), len(window) * (len(window) - 1) // 2))
        for a in range(len(window)):
            if not best:
                break
            for b in range(a + 1, len(window)):
                trial = set(ones) ^ {window[a], window[b]}
                got, total = measure(args.source, trial, args.flag, args.image,
                                     ignore, axis=args.axis, fixed=fixed)
                if total < best:
                    ones, scores, best = trial, got, total
                    print('  nodes %d,%d -> %d  %s' % (window[a], window[b], best,
                          ' '.join('%s=%d' % (k, v)
                                   for k, v in sorted(scores.items()) if v)))
                    if not best:
                        break

    kind = 'constant' if args.axis == 'constant' else 'argument'
    print('#pragma %s_flag %d' % (kind, args.flag))
    if ones:
        sys.stdout.write(''.join(
            line.replace('constant_flag_ones', kind + '_flag_ones')
            for line in quicktu.ones_pragma(sorted(ones))))
    print('remaining %d  %s' % (best, ' '.join(
        '%s=%d' % (k, v) for k, v in sorted(scores.items()) if v)))


if __name__ == '__main__':
    main()
