#!/usr/bin/env python3
"""Decompile the functions that exist only in the PAL prototype.

Run inside dcdecomp_dev (spimdisasm and m2c are there), from the repository root:

    ./dev.sh python3 re/ai/pal-prototype/extract.py <prototype.iso> <out-dir>

Both SCUS_971.11 programs keep their symbol tables. A function is PAL-only when its
name is absent from the retail program's symbol table. Each is disassembled from the
prototype and given to m2c with its jump tables and string literals attached, and
with build/ctx.c as context.
"""

import os
import re
import struct
import subprocess
import sys

RETAIL_ISO = "rom/Dark Cloud (USA).iso"
CTX = "build/ctx.c"
M2C = ["python3", "tools/m2c/m2c.py", "--target", "mipsee-mwcc-c++"]
SECTOR = 2048


def read_iso_file(iso, wanted):
    with open(iso, "rb") as f:
        f.seek(16 * SECTOR)
        pvd = f.read(SECTOR)
        root_lba, root_size = struct.unpack("<I", pvd[158:162])[0], struct.unpack("<I", pvd[166:170])[0]
        f.seek(root_lba * SECTOR)
        root = f.read(root_size)
        i = 0
        while i < len(root):
            length = root[i]
            if length == 0:
                i = (i // SECTOR + 1) * SECTOR
                continue
            record = root[i : i + length]
            name = record[33 : 33 + record[32]].decode(errors="replace").split(";")[0]
            if name == wanted:
                f.seek(struct.unpack("<I", record[2:6])[0] * SECTOR)
                return f.read(struct.unpack("<I", record[10:14])[0])
            i += length
    raise SystemExit(f"{wanted} is not in {iso}")


def function_names(elf_path):
    out = subprocess.run(["readelf", "-sW", elf_path], capture_output=True, text=True, check=True).stdout
    return {p[7] for p in (l.split() for l in out.splitlines()) if len(p) >= 8 and p[3] == "FUNC"}


def object_sizes(elf_path):
    out = subprocess.run(["readelf", "-sW", elf_path], capture_output=True, text=True, check=True).stdout
    sizes = {}
    for p in (l.split() for l in out.splitlines()):
        if len(p) >= 8 and p[3] == "OBJECT":
            try:
                sizes[int(p[1], 16)] = int(p[2], 0)
            except ValueError:
                pass
    return sizes


class Image:
    def __init__(self, data):
        self.data = data
        phoff = struct.unpack("<I", data[28:32])[0]
        phnum = struct.unpack("<H", data[44:46])[0]
        self.segments = [struct.unpack("<8I", data[phoff + i * 32 : phoff + (i + 1) * 32]) for i in range(phnum)]

    def read(self, address, size):
        for _, offset, vaddr, _, filesz, _, _, _ in self.segments:
            if vaddr <= address < vaddr + filesz:
                return self.data[offset + address - vaddr : offset + address - vaddr + size]
        return None


def encoded_address(asm, reference):
    """Local names such as @622 repeat across units, so use the address the instructions build."""
    ref = re.escape(reference)
    hi = re.search(r"/\* \w+ \w+ ([0-9A-F]{8}) \*/\s+lui\s+\S+ %hi\(" + ref + r"\)", asm)
    lo = re.search(r"/\* \w+ \w+ ([0-9A-F]{8}) \*/\s+\w+\s+.*%lo\(" + ref + r"\)", asm)
    if not hi or not lo:
        return None
    word = lambda h: int.from_bytes(bytes.fromhex(h), "little") & 0xFFFF
    low = word(lo.group(1))
    return (word(hi.group(1)) << 16) + (low - 0x10000 if low & 0x8000 else low)


def attach_data(asm, image, sizes):
    addresses = [int(a, 16) for a in re.findall(r"/\* \w+ ([0-9A-F]{8}) ", asm)]
    first, last = min(addresses), max(addresses)
    blocks = []
    for reference in sorted(set(re.findall(r'%(?:hi|lo)\(("[^"]+"|[^)]+)\)', asm))):
        address = encoded_address(asm, reference)
        if address is None or first <= address <= last:
            continue
        size = sizes.get(address, 0)
        targets = []
        while size == 0 or len(targets) * 4 < size:
            word = image.read(address + 4 * len(targets), 4)
            if not word or not first <= struct.unpack("<I", word)[0] <= last:
                break
            targets.append(struct.unpack("<I", word)[0])
        label = re.sub(r"\W", "_", reference.strip('"'))
        if len(targets) >= 2:
            name = "jtbl_" + label
            blocks.append(f"glabel {name}\n" + "".join(f".word .L{t:08X}\n" for t in targets))
            for t in set(targets):
                if not re.search(rf"^\s*\.L{t:08X}:", asm, re.M):
                    asm = re.sub(rf"^(\s*/\* \w+ {t:08X} )", rf".L{t:08X}:\n\1", asm, count=1, flags=re.M)
        else:
            raw = image.read(address, 512) or b""
            end = raw.find(b"\0")
            if end <= 0 or size not in (0, end + 1) or not all(32 <= c < 127 or c in (9, 10) for c in raw[:end]):
                continue
            name = "str_" + label
            text = raw[:end].decode().replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n").replace("\t", "\\t")
            blocks.append(f'glabel {name}\n.asciz "{text}"\n.balign 4\n')
        asm = asm.replace(f"({reference})", f"({name})")
    if blocks:
        asm += "\n.section .rodata\n" + "\n".join(blocks)
    return asm


def main():
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    iso, out = sys.argv[1:]
    work = os.path.join(out, "work")
    os.makedirs(work, exist_ok=True)

    prototype_elf = os.path.join(work, "prototype.elf")
    retail_elf = os.path.join(work, "retail.elf")
    open(prototype_elf, "wb").write(read_iso_file(iso, "SCUS_971.11"))
    open(retail_elf, "wb").write(read_iso_file(RETAIL_ISO, "SCUS_971.11"))

    only_pal = sorted(function_names(prototype_elf) - function_names(retail_elf))
    subprocess.run(["elfObjDisasm", prototype_elf, os.path.join(work, "disasm")], check=True)
    lines = open(os.path.join(work, "disasm", "prototype_main.text.s")).read().split("\n")
    image = Image(open(prototype_elf, "rb").read())
    sizes = object_sizes(prototype_elf)

    for symbol in only_pal:
        start = next((i for i, l in enumerate(lines) if re.match(r"glabel " + re.escape(symbol) + r"\b(?!\w)", l)), None)
        if start is None:
            print(f"{symbol}: not in the main text section", file=sys.stderr)
            continue
        end = next(j for j in range(start + 1, len(lines)) if lines[j].startswith("endlabel"))
        body = lines[start : end + 1]
        body[0] = f"glabel {symbol}"
        asm = attach_data(".set noat\n.set noreorder\n\n" + "\n".join(body) + "\n", image, sizes)
        asm_path = os.path.join(work, symbol + ".s")
        open(asm_path, "w").write(asm)

        with open(os.path.join(out, symbol + ".c"), "w") as c_file:
            result = subprocess.run(M2C + ["--context", CTX, asm_path], stdout=c_file, stderr=subprocess.DEVNULL)
        if result.returncode != 0:
            with open(os.path.join(out, symbol + ".c"), "w") as c_file:
                subprocess.run(M2C + [asm_path], stdout=c_file)
        print(symbol)


if __name__ == "__main__":
    main()
