#!/usr/bin/env python3
"""Remove source-owned symbol blocks from a residual assembly section."""

import argparse
import re
from pathlib import Path


GLABEL = re.compile(r"^glabel\s+(\S+)\s*$")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("symbols", nargs="*")
    parser.add_argument("--symbols-from", type=Path,
                        help="a file of symbol names, one per line")
    args = parser.parse_args()

    excluded = set(args.symbols)
    if args.symbols_from:
        excluded |= {line.strip() for line in
                     args.symbols_from.read_text(encoding="utf-8").splitlines()
                     if line.strip() and not line.startswith("#")}
    output = []
    skipping = False
    for line in args.input.read_text(encoding="utf-8").splitlines(keepends=True):
        match = GLABEL.match(line)
        if match:
            skipping = match.group(1) in excluded
        if not skipping:
            output.append(line)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("".join(output), encoding="utf-8")


if __name__ == "__main__":
    main()
