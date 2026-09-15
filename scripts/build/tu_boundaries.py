#!/usr/bin/env python3
"""Look for translation-unit boundaries inside a splat segment.

MWCC numbers a unit's invented names -- `@N` literals, `name$N` statics -- from
one, in order of first use, so within a unit they never go backwards. Walking a
segment's functions in address order and watching those numbers, a drop is a
translation-unit boundary and nothing else explains it.

A function may of course reach a constant an earlier function introduced, so
the drop to look for is in what a function *introduces*: a number below
everything seen so far. That is what this reports.

    tu_boundaries.py               every unit, only where a drop is found
    tu_boundaries.py <unit> ...    those units, with the whole sequence

See re/ai/unit_attribution_fish_charakey.md for the worked example, and
`finding-tu-boundaries` in the project memory for what the section runs add.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GLABEL = re.compile(r'^glabel\s+(?:"([^"]+)"|(\S+))', re.M)
WORD = re.compile(r"/\*\s+[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+[0-9A-Fa-f]{8}\s+\*/")
# An invented name of *this* unit. Splat gives a name that several units invent
# a `__N` suffix in all but one of them, so a suffixed name is another unit's
# constant reached from here and says nothing about this unit's numbering.
INVENTED = re.compile(r'%(?:hi|lo|gp_rel)\(\s*"?((?:@|[A-Za-z_]\w*\$)\d+)"?\s*\)')
SYMBOL = re.compile(r"^(\S+) = 0x([0-9a-fA-F]+);")
SEGMENT = re.compile(
    r"\{\s*start:\s*0x([0-9a-fA-F]+)\s*,\s*type:\s*\.rodata\s*,\s*name:\s*([^,}\s]+)"
)
VRAM = 0xFFF00


def addresses() -> dict[str, int]:
    found = {}
    for line in (ROOT / "config" / "main.symbols.txt").read_text().splitlines():
        match = SYMBOL.match(line.strip())
        if match:
            found.setdefault(match.group(1), int(match.group(2), 16))
    return found


def rodata_span(unit: str) -> tuple[int, int] | None:
    """The addresses a unit's own `.rodata` subsegment covers."""
    text = (ROOT / "config" / "main.yaml").read_text()
    starts = sorted(
        (int(m.group(1), 16) + VRAM, m.group(2)) for m in SEGMENT.finditer(text)
    )
    for index, (start, name) in enumerate(starts):
        if name == unit:
            stop = starts[index + 1][0] if index + 1 < len(starts) else 1 << 32
            return start, stop
    return None


def functions(path: Path, span=None, known=None):
    """Each function of a unit dump: its name, address and invented names.

    A name whose constant lives outside the unit's own `.rodata` -- a local
    array template in `.data`, or another unit's identical copy that the
    linker bound this reference to -- belongs to no run here and is dropped.
    """
    text = path.read_text(errors="replace")
    labels = list(GLABEL.finditer(text))
    for index, label in enumerate(labels):
        name = label.group(1) or label.group(2)
        end = labels[index + 1].start() if index + 1 < len(labels) else len(text)
        body = text[label.end():end]
        word = WORD.search(body)
        if word is None:
            continue
        found = INVENTED.findall(body)
        if span is not None:
            found = [
                match for match in found
                if span[0] <= known.get(match, -1) < span[1]
            ]
        numbers = {int(re.search(r"\d+", match).group()) for match in found}
        yield name, int(word.group(1), 16), numbers


def scan(unit: str, verbose: bool) -> list[tuple[str, int, int, int]]:
    """Report each function that introduces a number below everything before it."""
    path = ROOT / "asm" / f"{unit}.s"
    span = rodata_span(unit)
    if not path.is_file() or span is None:
        # with no `.rodata` of its own a unit invented no constant this test
        # can read, so every number in it is another unit's
        return []
    drops = []
    seen: set[int] = set()
    high = 0
    for name, address, numbers in functions(path, span, addresses()):
        introduced = {number for number in numbers if number not in seen}
        if verbose and numbers:
            print(f"  {address:08X} {min(numbers):5}..{max(numbers):<5} {name}")
        if introduced and high and min(introduced) < high:
            drops.append((name, address, min(introduced), high))
            # Everything past a boundary belongs to the next unit, whose
            # numbering starts again, so the run restarts here rather than
            # reporting every later function as another drop.
            seen = set(numbers)
            high = max(numbers)
            continue
        seen |= numbers
        high = max(high, max(numbers, default=0))
    return drops


def main() -> None:
    verbose = len(sys.argv) > 1
    units = sys.argv[1:] or sorted(
        path.stem for path in (ROOT / "asm").glob("*.s")
    )
    for unit in units:
        if verbose:
            print(f"== {unit}")
        drops = scan(unit, verbose)
        for name, address, low, high in drops:
            print(f"{unit}: 0x{address:08X} {name} introduces @{low} after @{high}")


if __name__ == "__main__":
    main()
