#!/usr/bin/env python3
"""Print what retail holds at an address: the float, the words, the bytes.

The small-data literals a function loads through `$gp` carry no symbol, so a
draft written from a decompiler reads `saved_reg_gp->unk-7F50` where the source
had a number. This resolves the address -- either given outright, or as the
`$gp` displacement the disassembly shows -- and prints the value.

    litval.py 0x2a18a0              at that address
    litval.py -0x7F50 --gp          at that displacement from _gp
    litval.py 0x2a18a0 --count 4    that many words
"""

from __future__ import annotations

import argparse
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
RETAIL = Path("/home/adubbz/development/re/Dark Cloud/SCUS_971.11")


def image() -> tuple[bytes, int]:
    """The main section's bytes and the address they start at."""
    data = RETAIL.read_bytes()
    count, size, offset = struct.unpack_from("<HHI", data, 0x30), 0, 0
    # section headers: e_shoff at 0x20, e_shentsize 0x2E, e_shnum 0x30
    shoff, shentsize, shnum, shstrndx = struct.unpack_from("<I", data, 0x20)[0], \
        struct.unpack_from("<H", data, 0x2E)[0], \
        struct.unpack_from("<H", data, 0x30)[0], \
        struct.unpack_from("<H", data, 0x32)[0]
    names = struct.unpack_from("<I", data, shoff + shstrndx * shentsize + 0x10)[0]
    for index in range(shnum):
        base = shoff + index * shentsize
        name_offset, _type, _flags, addr, off, size = struct.unpack_from("<IIIIII", data, base)
        name = data[names + name_offset:data.index(b"\0", names + name_offset)].decode()
        if name == "main":
            return data[off:off + size], addr
    raise SystemExit("litval: no `main` section in the retail ELF")


def gp() -> int:
    for line in (ROOT / "config" / "main.symbols.txt").read_text().splitlines():
        match = re.match(r"^_gp = 0x([0-9a-fA-F]+);", line.strip())
        if match:
            return int(match.group(1), 16)
    raise SystemExit("litval: no _gp")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("address")
    parser.add_argument("--gp", action="store_true", help="the address is a $gp displacement")
    parser.add_argument("--count", type=int, default=1)
    args = parser.parse_args()

    address = int(args.address, 16) if args.address.lower().startswith(("0x", "-0x")) \
        else int(args.address, 16)
    if args.gp:
        address += gp()
    data, base = image()
    for index in range(args.count):
        at = address + index * 4
        word = data[at - base:at - base + 4]
        if len(word) < 4:
            print(f"0x{at:08X} outside the image")
            continue
        value, = struct.unpack("<I", word)
        single, = struct.unpack("<f", word)
        print(f"0x{at:08X}  0x{value:08X}  {single!r}  {word.hex()}")


if __name__ == "__main__":
    main()
