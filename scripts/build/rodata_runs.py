#!/usr/bin/env python3
"""Read the object boundaries out of the image's `.rodata`.

MWLD concatenates each object's `.rodata` in link order, and an object emits
its own constants in the order MWCC invented their names, so the image reads as
one ascending run of `@N` per object. Where the numbering descends, one run has
ended and the next begun -- that is an object boundary, and the padding to
sixteen bytes that usually sits at the join confirms it.

This prints the runs and, for each, the splat segment the addresses currently
fall in. A run that straddles two segments, or a segment holding several runs,
is a translation-unit boundary drawn in the wrong place.

    rodata_runs.py                 every run, with the segment it falls in
    rodata_runs.py --disagree      only the runs whose segment attribution is wrong
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SYMBOL = re.compile(
    r"^(@\d+)(?:__\d+)? = 0x([0-9a-fA-F]+); // size:0x([0-9a-fA-F]+)"
)
SEGMENT = re.compile(
    r"\{\s*start:\s*0x([0-9a-fA-F]+)\s*,\s*type:\s*\.rodata\s*,\s*name:\s*([^,}\s]+)"
)
# splat's rodata segments are ROM offsets; the image is loaded 0xFFF00 above
VRAM = 0xFFF00


def constants() -> list[tuple[int, int, str]]:
    """Every invented constant of the image, by address."""
    found = []
    for line in (ROOT / "config" / "main.symbols.txt").read_text().splitlines():
        match = SYMBOL.match(line.strip())
        if match:
            found.append((int(match.group(2), 16), int(match.group(3), 16), match.group(1)))
    found.sort()
    return found


def segments() -> list[tuple[int, str]]:
    """Each `.rodata` subsegment's first address and unit name."""
    text = (ROOT / "config" / "main.yaml").read_text()
    found = [(int(m.group(1), 16) + VRAM, m.group(2)) for m in SEGMENT.finditer(text)]
    found.sort()
    return found


def owner(boundaries: list[tuple[int, str]], address: int) -> str:
    name = "?"
    for start, unit in boundaries:
        if start > address:
            break
        name = unit
    return name


def main() -> None:
    only_disagreeing = "--disagree" in sys.argv
    boundaries = segments()
    runs: list[list[tuple[int, int, str]]] = []
    previous = -1
    for address, size, name in constants():
        number = int(name[1:])
        if number < previous:
            runs.append([])
        elif not runs:
            runs.append([])
        runs[-1].append((address, size, name))
        previous = number

    for run in runs:
        units = {owner(boundaries, address) for address, _size, _name in run}
        first, last = run[0], run[-1]
        disagrees = len(units) > 1
        if only_disagreeing and not disagrees:
            continue
        mark = "  <-- straddles" if disagrees else ""
        print(
            "0x%08X-0x%08X  %-24s %s..%s  %d constants%s"
            % (first[0], last[0] + last[1], ",".join(sorted(units)),
               first[2], last[2], len(run), mark)
        )


if __name__ == "__main__":
    main()
