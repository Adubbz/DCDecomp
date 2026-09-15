#!/usr/bin/env python3
"""Count how much of the game is drafted and how much is still only assembly.

A function the build takes from assembly is drafted when its `INCLUDE_ASM`
marker sits in the `#else` of an `#ifdef NON_MATCHING`. This walks the sources
for those and reports, per unit, how many of its outstanding functions have a
draft.

    draft_status.py             the totals, and every unit with work left
    draft_status.py --all       every unit
    draft_status.py --names     the undrafted functions, one per line
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MANIFEST = ROOT / "config" / "ghidra_annotations.json"
GUARDED = re.compile(
    r"#ifdef\s+NON_MATCHING\b.*?#else\s*\n(.*?)#endif", re.S)
MARKER = re.compile(r'INCLUDE_ASM\("[^"]+",\s*([^)]+)\);')


def drafted(source: Path) -> set[str]:
    """The markers of one source that a guarded draft stands in front of."""
    if not source.is_file():
        return set()
    text = source.read_text(errors="replace")
    found = set()
    for block in GUARDED.finditer(text):
        found.update(name.strip() for name in MARKER.findall(block.group(1)))
    return found


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--names", action="store_true")
    args = parser.parse_args()

    rows = [r for r in json.loads(MANIFEST.read_text())["functions"] if r.get("assembly")]
    by_source: dict[str, list[dict]] = {}
    for row in rows:
        by_source.setdefault(row["source"], []).append(row)

    total = done = 0
    lines = []
    for source, functions in sorted(by_source.items()):
        have = drafted(ROOT / source)
        left = [f for f in functions if f["name"] not in have]
        total += len(functions)
        done += len(functions) - len(left)
        if left or args.all:
            lines.append((len(left), len(functions), source, left))
    lines.sort(key=lambda row: -row[0])

    if args.names:
        for _count, _of, _source, left in lines:
            for function in sorted(left, key=lambda f: int(f["address"], 16)):
                print(f"{function['translation_unit']:16} {function['address']} "
                      f"{function['size']:>7} {function['name']}")
        return

    for count, of, source, _left in lines:
        print(f"{count:4} of {of:4} left  {source}")
    print(f"\n{done} of {total} drafted, {total - done} to go "
          f"({100.0 * done / total:.1f}%)")


if __name__ == "__main__":
    main()
