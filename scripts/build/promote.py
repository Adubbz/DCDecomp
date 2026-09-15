#!/usr/bin/env python3
"""Move drafts between the guard and the build, and say which ones may stay.

A draft lives behind `#ifdef NON_MATCHING`, with the marker in the `#else`
supplying the build. A draft that already compiles to retail's bytes belongs in
the build instead, and this is what moves it -- and moves it back, which is the
common case.

    promote.py --out src/fader.cpp                 every draft of that source
    promote.py --out src/fader.cpp In__5FaderFv    just that one
    promote.py --in  src/fader.cpp [name ...]      put them back behind the guard

Nothing here decides whether a promotion is right: `build/lenchk.py` on the
object says whether the span still matches, and `scripts/build/verify.py`
says whether the bytes do. A function whose span differs moves every function
and every section after it in its unit, so check the span before linking.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BLOCK = re.compile(
    r"#ifdef[ \t]+NON_MATCHING[ \t]*\n(?P<body>.*?)\n#else[ \t]*\n"
    r"(?P<marker>[ \t]*INCLUDE_ASM\(\"(?P<dir>[^\"]+)\",[ \t]*(?P<name>[^)]+)\);)[ \t]*\n#endif",
    re.S)
LIVE = re.compile(
    r"(?P<lead>^|\n)(?P<body>(?:/\*\*(?:[^*]|\*(?!/))*\*/\n)?"
    r"[A-Za-z_][^\n]*?\b(?P<mangled>\w+)\s*\([^;]*?\)\s*\{.*?\n\})", re.S)


def guarded(text: str) -> dict[str, re.Match]:
    return {match.group("name").strip(): match for match in BLOCK.finditer(text)}


def unguard(text: str, wanted: set[str]) -> tuple[str, list[str]]:
    """Let the drafts stand as the build's own code."""
    moved = []
    while True:
        for match in BLOCK.finditer(text):
            name = match.group("name").strip()
            if wanted and name not in wanted:
                continue
            body = match.group("body")
            text = text[:match.start()] + body + text[match.end():]
            moved.append(name)
            break
        else:
            return text, moved


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    direction = parser.add_mutually_exclusive_group(required=True)
    direction.add_argument("--out", action="store_true", help="draft -> build")
    direction.add_argument("--in", dest="back", action="store_true", help="build -> draft")
    parser.add_argument("source", type=Path)
    parser.add_argument("names", nargs="*")
    args = parser.parse_args()

    path = ROOT / args.source
    text = path.read_text()
    wanted = set(args.names)

    if args.out:
        text, moved = unguard(text, wanted)
        path.write_text(text)
        print(f"{args.source}: promoted {len(moved)}: {' '.join(moved)}")
        return

    # Putting one back needs the marker it stood in front of, which the
    # promotion consumed; the manifest still knows it.
    import json
    manifest = json.loads((ROOT / "config" / "ghidra_annotations.json").read_text())
    markers = {
        row["name"]: 'INCLUDE_ASM("asm/nonmatchings/%s", %s);'
                     % (row["translation_unit"], row["name"])
        for row in manifest["functions"]
        if row.get("assembly") and row["source"] == str(args.source)
    }
    if not wanted:
        sys.exit("promote --in needs the function names to put back")
    moved = []
    for name in wanted:
        marker = markers.get(name)
        if marker is None:
            print(f"  {name} is not a marker of {args.source}")
            continue
        found = None
        for match in LIVE.finditer(text):
            if match.group("mangled") == name.split("__")[0] or name in match.group("body"):
                found = match
        if found is None:
            print(f"  no live definition of {name} found")
            continue
        body = found.group("body")
        text = (text[:found.start("body")]
                + f"#ifdef NON_MATCHING\n{body}\n#else\n{marker}\n#endif"
                + text[found.end("body"):])
        moved.append(name)
    path.write_text(text)
    print(f"{args.source}: guarded {len(moved)}: {' '.join(moved)}")


if __name__ == "__main__":
    main()
