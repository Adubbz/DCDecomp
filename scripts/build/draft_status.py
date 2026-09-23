#!/usr/bin/env python3
"""Count how much game code is drafted and how much is still only assembly.

A function the build takes from assembly is drafted when its `INCLUDE_ASM`
marker sits in the fallback branch of a `NON_MATCHING` conditional. A bare
marker is undrafted, while a promoted function has no marker and is complete.
This walks the current sources for those markers and uses the Ghidra manifest
as the complete function list.

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
MARKER = re.compile(r'INCLUDE_ASM\("[^"]+",\s*([^)]+)\);')
DIRECTIVE = re.compile(r"^\s*#\s*(ifdef|ifndef|if|else|elif|endif)\b(.*)$")
DEFINED = re.compile(r"\bdefined\s*(?:\(\s*)?NON_MATCHING\b")
NOT_DEFINED = re.compile(r"!\s*defined\s*(?:\(\s*)?NON_MATCHING\b")


def remaining(source: Path) -> dict[str, bool]:
    """Return each remaining marker and whether it has a guarded draft."""
    if not source.is_file():
        return {}

    # Each stack entry is [NON_MATCHING condition polarity, in fallback].
    # A polarity of 1 means the true branch enables drafts; -1 means the true
    # branch is the assembly fallback; 0 is an unrelated conditional.
    stack: list[list[int | bool]] = []
    found: dict[str, bool] = {}
    for line in source.read_text(errors="replace").splitlines():
        directive = DIRECTIVE.match(line)
        if directive:
            kind, expression = directive.groups()
            if kind in ("ifdef", "ifndef", "if"):
                polarity = 0
                if kind == "ifdef" and expression.strip().startswith("NON_MATCHING"):
                    polarity = 1
                elif kind == "ifndef" and expression.strip().startswith("NON_MATCHING"):
                    polarity = -1
                elif kind == "if" and DEFINED.search(expression):
                    polarity = -1 if NOT_DEFINED.search(expression) else 1
                stack.append([polarity, False])
            elif kind in ("else", "elif") and stack:
                stack[-1][1] = True
            elif kind == "endif" and stack:
                stack.pop()

        for name in MARKER.findall(line):
            guarded = any(
                (polarity == 1 and fallback) or (polarity == -1 and not fallback)
                for polarity, fallback in stack
            )
            found[name.strip()] = guarded
    return found


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--names", action="store_true")
    args = parser.parse_args()

    manifest_rows = [
        row for row in json.loads(MANIFEST.read_text())["functions"] if row.get("assembly")
    ]
    by_source: dict[str, dict[str, dict]] = {}
    for row in manifest_rows:
        by_source.setdefault(row["source"], {})[row["name"]] = row

    total = done = 0
    lines = []
    for source, metadata in sorted(by_source.items()):
        # Translation-unit boundary symbols also use INCLUDE_ASM, but are not
        # functions and therefore have no Ghidra function record.
        markers = {
            name: guarded
            for name, guarded in remaining(ROOT / source).items()
            if name in metadata
        }

        functions = list(metadata.values())
        left = [metadata[name] for name, guarded in markers.items() if not guarded]
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
    percent = 100.0 if total == 0 else 100.0 * done / total
    print(f"\n{done} of {total} drafted or promoted, {total - done} undrafted "
          f"({percent:.1f}%)")


if __name__ == "__main__":
    main()
