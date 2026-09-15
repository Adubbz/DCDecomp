#!/usr/bin/env python3
"""Let a batch of drafts into the build, and put them back unless they match.

A draft that already compiles to retail's bytes belongs in the build rather
than behind the guard. Whether it does is not a local question: a promoted
unit contributes its own `.text`, and whatever data the compiled code emits or
stops emitting moves every later address, so the only honest test is a link
and a whole-image compare.

This does that for a batch. It copies the sources aside, promotes every draft
in them, builds, and keeps the promotion only if the image is still
byte-perfect in data and no function that matched before stopped matching.
Anything less and the sources go back exactly as they were.

    try_promote.py src/fader.cpp src/water.cpp
    try_promote.py --all                 every source carrying a draft

Run it from the repository root, outside the container -- it drives
`./dev.sh` itself. Nothing else may be building at the same time.
"""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
COUNTS = re.compile(
    r"(\S+): .*?\((\d+) perfect, (\d+) fuzzy, (\d+) asm, (\d+) unmatched"
    r"(?:, (\d+) data bytes differ)?\)")
GUARD = re.compile(r"^#ifdef\s+NON_MATCHING\s*$", re.M)


def verify() -> dict[str, tuple[int, int, int, int, int]]:
    """Each image's (perfect, fuzzy, asm, unmatched, differing data bytes)."""
    done = subprocess.run(
        ["./dev.sh", "python3", "scripts/build/verify.py", "-c"],
        cwd=ROOT, capture_output=True, text=True)
    text = re.sub(r"\x1b\[[0-9;]*m", "", done.stdout + done.stderr)
    return {
        m.group(1): tuple(int(m.group(i) or 0) for i in range(2, 7))
        for m in COUNTS.finditer(text)
    }


def build() -> None:
    subprocess.run(["./dev.sh", "cmake", "--build", "build"],
                   cwd=ROOT, capture_output=True, text=True)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", nargs="*", type=Path)
    parser.add_argument("--all", action="store_true")
    args = parser.parse_args()

    sources = args.sources
    if args.all or not sources:
        sources = [
            path.relative_to(ROOT)
            for path in sorted((ROOT / "src").rglob("*"))
            if path.suffix in {".c", ".cpp"} and GUARD.search(path.read_text(errors="replace"))
        ]
    if not sources:
        sys.exit("try_promote: nothing carries a draft")

    print("baseline")
    build()
    before = verify()
    for image, row in before.items():
        print(f"  {image}: {row[0]} perfect, {row[4]} data bytes differ")

    with tempfile.TemporaryDirectory() as keep:
        saved = {}
        promoted = 0
        for source in sources:
            saved[source] = Path(keep) / source.name
            shutil.copy(ROOT / source, saved[source])
            done = subprocess.run(
                [sys.executable, "scripts/build/promote.py", "--out", str(source)],
                cwd=ROOT, capture_output=True, text=True)
            print(" ", done.stdout.strip())
            promoted += len(done.stdout.split(":")[-1].split())

        print(f"built with {promoted} draft(s) promoted")
        build()
        after = verify()

        kept = True
        for image, row in after.items():
            was = before.get(image)
            if was is None:
                continue
            if row[4] or row[0] < was[0] or row[3] > was[3]:
                kept = False
            print(f"  {image}: {row[0]} perfect (was {was[0]}), "
                  f"{row[4]} data bytes differ")

        if kept and any(after[i][0] > before[i][0] for i in after):
            print("kept: the image is intact and more of it matches")
            return
        print("put back: nothing matched outright")
        for source, copy in saved.items():
            shutil.copy(copy, ROOT / source)
    build()


if __name__ == "__main__":
    main()
