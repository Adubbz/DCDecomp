#!/usr/bin/env python3
"""Correct `@address` and `@size` in documentation against the symbol tables.

A documented function block only reaches Ghidra when its `@address` and `@size`
match the retail symbol exactly -- `generate_dark_cloud_annotations.py` drops
any block that disagrees, because documentation bound to the wrong extent is
not safe to apply. Header blocks written from a disassembler's rounded-up
function view carry the padding to the next sixteen-byte boundary, so most of
them disagree by four, eight or twelve bytes and their prose never arrives.

The symbol tables under `config/` are generated from the retail ELF and are
what the build itself uses, so they decide. Run this after writing new
documentation, or after a re-split moves a function.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SYMBOL_RE = re.compile(
    r"^(\S+) = 0x([0-9a-fA-F]+); // type:func size:0x([0-9a-fA-F]+)"
)
DOC_RE = re.compile(r"/\*\*(.*?)\*/", re.S)
TAG_RE = re.compile(r"@(mangled|address|size)\s+([^\s*]+)")


def retail_functions() -> dict[str, tuple[int, int]]:
    """Every retail function symbol, by mangled name, dropping ambiguous ones."""
    functions: dict[str, tuple[int, int]] = {}
    ambiguous: set[str] = set()
    for image in ("main", "title", "dun"):
        path = ROOT / "config" / f"{image}.symbols.txt"
        if not path.is_file():
            continue
        for line in path.read_text().splitlines():
            match = SYMBOL_RE.match(line.strip())
            if match is None:
                continue
            name = match.group(1)
            record = (int(match.group(2), 16), int(match.group(3), 16))
            if functions.get(name, record) != record:
                ambiguous.add(name)
            functions[name] = record
    for name in ambiguous:
        functions.pop(name, None)
    return functions


def correct(text: str, functions: dict[str, tuple[int, int]]) -> tuple[str, list[str]]:
    """Rewrite the address and size tags of every block naming a known symbol."""
    changes: list[str] = []
    pieces: list[str] = []
    end = 0
    for block in DOC_RE.finditer(text):
        tags = dict(TAG_RE.findall(block.group(1)))
        name = tags.get("mangled")
        if not name or "address" not in tags or "size" not in tags:
            continue
        retail = functions.get(name)
        if retail is None:
            continue
        try:
            documented = (int(tags["address"], 0), int(tags["size"], 0))
        except ValueError:
            continue
        if documented == retail:
            continue
        body = block.group(0)
        body = re.sub(r"(@address\s+)\S+", r"\g<1>0x%X" % retail[0], body, count=1)
        body = re.sub(r"(@size\s+)\S+", r"\g<1>0x%X" % retail[1], body, count=1)
        pieces.append(text[end : block.start()])
        pieces.append(body)
        end = block.end()
        changes.append(
            "%s 0x%X/0x%X -> 0x%X/0x%X"
            % (name, documented[0], documented[1], retail[0], retail[1])
        )
    pieces.append(text[end:])
    return "".join(pieces), changes


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true",
                        help="report what would change and exit non-zero if anything would")
    arguments = parser.parse_args()

    functions = retail_functions()
    total = 0
    # A file-scope static cannot be declared in a header, so the unit that
    # defines it documents it in place; those blocks are read the same way.
    sources = sorted((ROOT / "include").rglob("*")) + sorted((ROOT / "src").rglob("*"))
    for path in sources:
        if not path.is_file() or path.suffix not in {".h", ".hpp", ".c", ".cpp"}:
            continue
        text = path.read_text(errors="replace")
        corrected, changes = correct(text, functions)
        if not changes:
            continue
        total += len(changes)
        print(f"{path.relative_to(ROOT).as_posix()}:")
        for change in changes:
            print(f"  {change}")
        if not arguments.check:
            path.write_text(corrected)
    print(f"{'would correct' if arguments.check else 'corrected'} {total} block(s)")
    raise SystemExit(1 if arguments.check and total else 0)


if __name__ == "__main__":
    main()
