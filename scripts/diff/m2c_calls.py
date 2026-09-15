#!/usr/bin/env python3
"""Fold m2c's mangled calls back into the source spelling.

m2c prints every call by the retail symbol, so a method reads as
`Down__8CGamePadFi(&GamePad, 0x40)`. The mangling already says which argument
is the receiver -- a method's first argument always is -- so the same call can
be written the way the source had it, `GamePad.Down(0x40)`, and a free
function can drop its argument encoding.

    m2c_calls.py < draft.c > draft.c      as a filter
    m2c_calls.py <file> [-o <out>]        or in place of one

Nothing here is a fact about the code: it is a rename, and a call it cannot
parse is left exactly as m2c printed it.
"""

from __future__ import annotations

import argparse
import re
import sys

# name__<Q<n>>?<len><class>F<arguments>, or name__F<arguments> for a free one
METHOD = re.compile(r"\b(\w+)__(Q\d+)?(\d+)([A-Za-z_]\w*)(F[\w\d_]*)\s*\(")
FREE = re.compile(r"\b(\w+)__(F[\w\d_]*)\s*\(")
# an expression naming one object, as against a parameter declaration
RECEIVER = re.compile(r"^&?[\w.\[\]]+(?:->[\w.\[\]]+)*$")


def split_arguments(text: str, start: int) -> tuple[list[str], int]:
    """The argument list starting just past `(`, and where the `)` is."""
    depth, index, current, found = 1, start, [], []
    while index < len(text) and depth:
        character = text[index]
        if character in "([":
            depth += 1
        elif character in ")]":
            depth -= 1
            if not depth:
                break
        if character == "," and depth == 1:
            found.append("".join(current).strip())
            current = []
        else:
            current.append(character)
        index += 1
    tail = "".join(current).strip()
    if tail:
        found.append(tail)
    return found, index


def fold(text: str) -> str:
    out = []
    index = 0
    while True:
        match = METHOD.search(text, index)
        if not match:
            break
        # the class-name length must be the length the mangling claims
        if len(match.group(4)) != int(match.group(3)):
            out.append(text[index:match.end()])
            index = match.end()
            continue
        arguments, close = split_arguments(text, match.end())
        if not arguments:
            out.append(text[index:match.end()])
            index = match.end()
            continue
        receiver, rest = arguments[0], arguments[1:]
        # a prototype's first argument is a declaration, not a receiver
        if not RECEIVER.match(receiver):
            out.append(text[index:match.end()])
            index = match.end()
            continue
        access = f"{receiver[1:]}." if receiver.startswith("&") else f"{receiver}->"
        out.append(text[index:match.start()])
        out.append(f"{access}{match.group(1)}({', '.join(rest)})")
        index = close + 1
    out.append(text[index:])
    return FREE.sub(lambda m: m.group(1) + "(", "".join(out))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("file", nargs="?")
    parser.add_argument("-o", "--output")
    args = parser.parse_args()
    text = open(args.file).read() if args.file else sys.stdin.read()
    folded = fold(text)
    if args.output:
        open(args.output, "w").write(folded)
    else:
        sys.stdout.write(folded)


if __name__ == "__main__":
    main()
