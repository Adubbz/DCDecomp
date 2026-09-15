#!/usr/bin/env python3
"""Ask which unit's constants each function actually reaches.

MWLD lays an object's `.rodata` down in one piece, so a function's invented
constants live in its own unit's rodata subsegment. A run of functions whose
constants live in the *neighbouring* unit's subsegment is a run of functions on
the wrong side of the text boundary.

    tu_attribution.py              every function whose constants live elsewhere
    tu_attribution.py <unit> ...   those units, with every function listed

The answer is only as good as the subsegment list it is checked against, so a
disagreement is a question, not a verdict; confirm it against the numbering
(`tu_boundaries.py`) before moving a boundary.
"""

from __future__ import annotations

import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GLABEL = re.compile(r'^glabel\s+(?:"([^"]+)"|(\S+))', re.M)
WORD = re.compile(r"/\*\s+[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+[0-9A-Fa-f]{8}\s+\*/")
REFERENCE = re.compile(r'%(?:hi|lo|gp_rel)\(\s*"?((?:@|[A-Za-z_]\w*\$)[\w$]*)"?\s*\)')
SYMBOL = re.compile(r"^(\S+) = 0x([0-9a-fA-F]+);")
SEGMENT = re.compile(
    r"\{\s*start:\s*0x([0-9a-fA-F]+)\s*,\s*type:\s*(\.rodata|cpp)\s*,\s*name:\s*([^,}\s]+)"
)
# what follows the last `.rodata` subsegment is the literal pool, the vtables
# and the static initialisers -- shared, and owned by no unit
RDATA = re.compile(r"\{\s*start:\s*0x([0-9a-fA-F]+)\s*,\s*type:\s*rdata\b")
VRAM = 0xFFF00
POOL = 0


def symbol_addresses() -> dict[str, int]:
    found = {}
    for line in (ROOT / "config" / "main.symbols.txt").read_text().splitlines():
        match = SYMBOL.match(line.strip())
        if match:
            found.setdefault(match.group(1), int(match.group(2), 16))
    return found


def subsegments(kind: str) -> list[tuple[int, str]]:
    text = (ROOT / "config" / "main.yaml").read_text()
    found = [
        (int(m.group(1), 16) + VRAM, m.group(3))
        for m in SEGMENT.finditer(text) if m.group(2) == kind
    ]
    found.sort()
    return found


def pool_start() -> int:
    match = RDATA.search((ROOT / "config" / "main.yaml").read_text())
    return int(match.group(1), 16) + VRAM if match else 1 << 32


def owner(boundaries: list[tuple[int, str]], address: int) -> str | None:
    if address >= POOL:
        return None
    name = None
    for start, unit in boundaries:
        if start > address:
            break
        name = unit
    return name


def main() -> None:
    global POOL
    POOL = pool_start()
    addresses = symbol_addresses()
    rodata = subsegments(".rodata")
    verbose = len(sys.argv) > 1
    units = sys.argv[1:] or sorted(path.stem for path in (ROOT / "asm").glob("*.s"))

    for unit in units:
        path = ROOT / "asm" / f"{unit}.s"
        if not path.is_file():
            continue
        text = path.read_text(errors="replace")
        labels = list(GLABEL.finditer(text))
        if verbose:
            print(f"== {unit}")
        for index, label in enumerate(labels):
            name = label.group(1) or label.group(2)
            end = labels[index + 1].start() if index + 1 < len(labels) else len(text)
            body = text[label.end():end]
            word = WORD.search(body)
            if word is None:
                continue
            homes = Counter()
            for reference in REFERENCE.findall(body):
                address = addresses.get(reference)
                if address is None:
                    continue
                home = owner(rodata, address)
                if home is not None:
                    homes[home] += 1
            if not homes:
                continue
            best, count = homes.most_common(1)[0]
            if verbose:
                print(f"  {int(word.group(1), 16):08X} {best:<18} {dict(homes)} {name}")
            elif best != unit:
                print(
                    "%s: 0x%08X %s -- constants live in %s (%d of %d)"
                    % (unit, int(word.group(1), 16), name, best, count, sum(homes.values()))
                )


if __name__ == "__main__":
    main()
