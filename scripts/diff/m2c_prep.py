#!/usr/bin/env python3
"""Prepare a splat function dump for m2c.

Two things in the dumps stop m2c cold, and both are spellings rather than
facts about the code:

* a `jr` through a jump table. m2c only recognises a table whose label starts
  with `jtbl_`, `jpt_`, `lbl_` or `jumptable_`, and splat calls it `@N` like
  any other invented constant, so the function comes out as one failure
  comment. The table's own words are appended too, since m2c reads the branch
  targets out of them.
* a `$gp` displacement. Left alone every small-data global reads as
  `saved_reg_gp->unk-6358`; resolved against `_gp` each one becomes the symbol
  the address belongs to.

    m2c_prep.py <dump.s> [-o <prepared.s>]

Writes the prepared copy (default: `build/m2c/<name>.s`) and prints its path.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SYMBOL = re.compile(r"^(\S+) = 0x([0-9a-fA-F]+);(.*)$")
SIZE = re.compile(r"size:0x([0-9a-fA-F]+)")
INSTRUCTION = re.compile(r"^\s*/\*[^*]*\*/\s+(\S+)\s+(.*?)\s*$")
LOW = re.compile(r'%lo\(\s*"?([^")\s]+)"?\s*\)')
GP = re.compile(r"(-?0x[0-9a-fA-F]+)\(\$28\)")
JUMP = re.compile(r"^\s*/\*[^*]*\*/\s+jr\s+\$(\d+)\s*$")


def symbols(image: str) -> tuple[dict[str, int], list[tuple[int, int, str]]]:
    """Every retail symbol, by name and sorted by address with its size."""
    by_name: dict[str, int] = {}
    rows: list[tuple[int, int, str]] = []
    for line in (ROOT / "config" / f"{image}.symbols.txt").read_text().splitlines():
        match = SYMBOL.match(line.strip())
        if not match:
            continue
        address = int(match.group(2), 16)
        by_name.setdefault(match.group(1), address)
        size = SIZE.search(match.group(3))
        rows.append((address, int(size.group(1), 16) if size else 0, match.group(1)))
    rows.sort()
    return by_name, rows


def jump_tables(text: str) -> list[str]:
    """The constants this function's `jr` instructions index."""
    lines = text.splitlines()
    found = []
    for index, line in enumerate(lines):
        match = JUMP.match(line)
        if not match or match.group(1) == "31":
            continue
        # the table's address is materialised a few instructions above the jump
        for earlier in reversed(lines[max(0, index - 12):index]):
            low = LOW.search(earlier)
            if low and low.group(1).startswith("@"):
                found.append(low.group(1))
                break
    return found


def rename(name: str) -> str:
    return "jtbl_" + re.sub(r"[^A-Za-z0-9_]", "_", name.lstrip("@"))


def table_words(image: str, name: str) -> str:
    """The table's own `.word` lines, which m2c reads the case targets from."""
    for unit in (ROOT / "asm" / "nonmatchings").iterdir():
        path = unit / f"{name}.s"
        if path.is_file():
            body = path.read_text(errors="replace")
            body = re.sub(r'^glabel\s+"?' + re.escape(name) + r'"?\s*$',
                          f"glabel {rename(name)}", body, flags=re.M)
            return "\n".join(
                line for line in body.splitlines()
                if not line.startswith((".include", ".set"))
            )
    return ""


def resolve_gp(text: str, rows: list[tuple[int, int, str]], base: int) -> str:
    """Turn each `$gp` displacement into the symbol its address starts."""
    starts = {address: name for address, _size, name in rows}

    def replace(match: re.Match) -> str:
        address = base + int(match.group(1), 16)
        name = starts.get(address)
        if name is None:
            return match.group(0)
        # splat quotes a name that is not an identifier, and so must we
        if not re.match(r"^[A-Za-z_]\w*$", name):
            name = f'"{name}"'
        return f"%gp_rel({name})($28)"

    return GP.sub(replace, text)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dump")
    parser.add_argument("-o", "--output")
    parser.add_argument("--image", default="main")
    args = parser.parse_args()

    source = Path(args.dump)
    text = source.read_text(errors="replace")
    by_name, rows = symbols(args.image)
    gp = by_name.get("_gp")
    if gp is None:
        sys.exit(f"m2c_prep: {args.image} has no _gp")

    text = resolve_gp(text, rows, gp)
    appended = []
    for name in dict.fromkeys(jump_tables(text)):
        text = text.replace(f'"{name}"', rename(name)).replace(name, rename(name))
        words = table_words(args.image, name)
        if words:
            appended.append(words)
    if appended:
        text = text.rstrip("\n") + "\n\n" + "\n\n".join(appended) + "\n"

    output = Path(args.output) if args.output else ROOT / "build" / "m2c" / source.name
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(text)
    print(output)


if __name__ == "__main__":
    main()
