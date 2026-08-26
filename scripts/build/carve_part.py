#!/usr/bin/env python3
"""Split a residual section dump into the runs a decompiled unit leaves behind.

A unit that owns part of a section supplies those bytes from its own object, so
the dump must stop where the unit's run starts and pick up again where it ends.
The ranges are given as addresses because a generated constant has no name to
key on.

    carve_part.py <input.s> <out.s>[:<lo>-<hi>]...

Each output holds the lines whose address falls in its half-open range. A
label goes with the datum that follows it.
"""
import argparse
import re
from pathlib import Path

# `/* ROM VRAM HEX */ .word ...` for a section with contents, `/* VRAM */
# .space ...` for one without.
ADDRESSED = re.compile(r"^\s*/\* (?:[0-9A-Fa-f]{5,8} )?([0-9A-Fa-f]{8})(?: [0-9A-Fa-f ]+)?\s*\*/")
LABEL = re.compile(r"^\s*(?:glabel|jlabel|dlabel)\s+\S+\s*$|^\s*\.align\b|^\s*/\* Automatically")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("outputs", nargs="+")
    args = parser.parse_args()

    ranges = []
    for spec in args.outputs:
        path, _, span = spec.partition(":")
        lo, _, hi = span.partition("-")
        ranges.append((Path(path), int(lo, 16), int(hi, 16), []))

    lines = args.input.read_text(encoding="utf-8").splitlines(keepends=True)
    header = []
    for line in lines:
        if ADDRESSED.match(line) or LABEL.match(line):
            break
        header.append(line)

    pending = []
    for line in lines[len(header):]:
        match = ADDRESSED.match(line)
        if not match:
            pending.append(line)
            continue
        address = int(match.group(1), 16)
        for path, lo, hi, out in ranges:
            if lo <= address < hi:
                out.extend(pending)
                out.append(line)
                break
        pending = []

    for path, lo, hi, out in ranges:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text("".join(header + out), encoding="utf-8")


if __name__ == "__main__":
    main()
