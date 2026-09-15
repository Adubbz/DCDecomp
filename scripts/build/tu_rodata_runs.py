#!/usr/bin/env python3
"""Split each unit's `.rodata` subsegment into the objects that wrote it.

MWLD lays one object's `.rodata` down in a single run, and MWCC emits a unit's
invented constants in the order it named them, so a subsegment holding several
ascending `@N` runs holds several objects. For each run this reports the first
function of the unit that reaches it -- that function is where the object's
text begins, give or take the functions between it and the previous run's last
reader, which reach no constant and so cannot be placed by this test.

    tu_rodata_runs.py              every unit whose subsegment holds two or more
    tu_rodata_runs.py <unit> ...   those units, run by run
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SYMBOL = re.compile(r"^(\S+) = 0x([0-9a-fA-F]+); // size:0x([0-9a-fA-F]+)")
INVENTED = re.compile(r"^@(\d+)(?:__\d+)?$")
SEGMENT = re.compile(
    r"\{\s*start:\s*0x([0-9a-fA-F]+)\s*,\s*type:\s*\.rodata\s*,\s*name:\s*([^,}\s]+)"
)
GLABEL = re.compile(r'^glabel\s+(?:"([^"]+)"|(\S+))', re.M)
WORD = re.compile(r"/\*\s+[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+")
REFERENCE = re.compile(r'%(?:hi|lo|gp_rel)\(\s*"?(@[\w$]*)"?\s*\)')
VRAM = 0xFFF00


def symbols() -> dict[str, tuple[int, int]]:
    found = {}
    for line in (ROOT / "config" / "main.symbols.txt").read_text().splitlines():
        match = SYMBOL.match(line.strip())
        if match:
            found.setdefault(match.group(1), (int(match.group(2), 16), int(match.group(3), 16)))
    return found


def subsegments() -> list[tuple[int, int, str]]:
    text = (ROOT / "config" / "main.yaml").read_text()
    starts = sorted(
        (int(m.group(1), 16) + VRAM, m.group(2)) for m in SEGMENT.finditer(text)
    )
    return [
        (start, starts[index + 1][0] if index + 1 < len(starts) else 1 << 32, unit)
        for index, (start, unit) in enumerate(starts)
    ]


def runs(entries: list[tuple[int, int, str]]) -> list[list[tuple[int, int, str]]]:
    """Cut the subsegment where the numbering starts over below where it began.

    Within one object the numbering can invert by a step or two -- MWCC emits a
    function's constants in use order, not name order -- so the join to look
    for is a number below the run's own first, on an address the linker had to
    pad to.
    """
    found: list[list[tuple[int, int, str]]] = []
    low = None
    end = None
    for address, size, name in entries:
        number = int(INVENTED.match(name).group(1))
        # a descent is only an object join where the linker aligned the address
        joined = end is not None and address > end and address % 8 == 0
        if not found or (low is not None and number < low and joined):
            found.append([])
            low = None
        found[-1].append((address, size, name))
        low = number if low is None else min(low, number)
        end = address + size
    return found


def readers(unit: str, addresses: dict[str, tuple[int, int]]):
    """Each function of a unit dump, with the constant addresses it reaches."""
    path = ROOT / "asm" / f"{unit}.s"
    if not path.is_file():
        return
    text = path.read_text(errors="replace")
    labels = list(GLABEL.finditer(text))
    for index, label in enumerate(labels):
        name = label.group(1) or label.group(2)
        if name.startswith("@"):
            continue
        stop = labels[index + 1].start() if index + 1 < len(labels) else len(text)
        body = text[label.end():stop]
        word = WORD.search(body)
        if word is None:
            continue
        reached = {
            addresses[reference][0]
            for reference in REFERENCE.findall(body)
            if reference in addresses
        }
        yield name, int(word.group(1), 16), reached


def main() -> None:
    addresses = symbols()
    wanted = set(sys.argv[1:])
    constants = sorted(
        (address, size, name)
        for name, (address, size) in addresses.items()
        if INVENTED.match(name)
    )
    for start, stop, unit in subsegments():
        if unit.startswith("lib/") or (wanted and unit not in wanted):
            continue
        entries = [row for row in constants if start <= row[0] < stop]
        found = runs(entries)
        if len(found) < 2 and not wanted:
            continue
        functions = list(readers(unit, addresses))
        first_reader = []
        for run in found:
            span = {address for address, _size, _name in run}
            reaching = [(a, n) for n, a, reached in functions if reached & span]
            first_reader.append(reaching[0] if reaching else None)
        # a run the previous run's own first reader also reaches is not a join:
        # one function's constants come out in use order, not name order
        if len(found) == 2 and first_reader[0] and first_reader[0] == first_reader[1]:
            continue
        print(f"== {unit}  0x{start:08X}..0x{stop:08X}  {len(found)} run(s)")
        for run in found:
            span = {address for address, _size, _name in run}
            reaching = [(a, n) for n, a, reached in functions if reached & span]
            first = f"0x{reaching[0][0]:08X} {reaching[0][1]}" if reaching else "(no reader)"
            last = f"0x{reaching[-1][0]:08X} {reaching[-1][1]}" if reaching else ""
            print(
                f"   0x{run[0][0]:08X}..0x{run[-1][0] + run[-1][1]:08X}"
                f"  {run[0][2]}..{run[-1][2]}  {len(run)} constants"
            )
            print(f"     first {first}")
            if last and last != first:
                print(f"     last  {last}")


if __name__ == "__main__":
    main()
