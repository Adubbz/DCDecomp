#!/usr/bin/env python3
"""Run tools/mwccgap for one release.

    mwccgap_region.py <mwccgap.py's arguments>

mwccgap reads its INCLUDE_ASM and INCLUDE_RODATA markers straight out of the
source text, before the compiler has seen it, so a marker a `#ifdef PAL` guard
leaves out would still be spliced in. This hands it the source as the release
being built compiles it -- the release is the one the compiler flags name --
and points a marker at that release's own reference assembly.

It also takes a third marker mwccgap has no notion of:

    INCLUDE_DATA("<directory>", <name>);

A function a marker supplies keeps its data where retail put it -- a static
inside it, a table only it reads -- and C cannot define that under retail's
name. The marker stands in the unit's data at the place the datum belongs:
the compiler is handed a placeholder of the datum's size and kind there, so it
takes the datum's place among the unit's own, and once the object is written
the placeholder is given the bytes and relocations of `<directory>/<name>.s`,
which the split writes from retail's section dump.
"""

import io
import os
import re
import runpy
import subprocess
import sys
import tempfile
from pathlib import Path

if "-DPAL" in sys.argv[1:]:
    os.environ["DCDECOMP_REGION"] = "PAL"
else:
    os.environ["DCDECOMP_REGION"] = "NTSC"

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import region  # noqa: E402

MWCCGAP = os.environ.get("MWCCGAP_DIR", "tools/mwccgap")
sys.path.insert(0, MWCCGAP)
from mwccgap.constants import SYMBOL_AT, SYMBOL_DOLLAR  # noqa: E402
from mwccgap.elf import Elf  # noqa: E402
from mwccgap.preprocessor import Preprocessor  # noqa: E402

MARKER = re.compile(r'^((?:INCLUDE_ASM|INCLUDE_RODATA)\(")([^"]*)(".*)$')
DATA_MARKER = re.compile(r'^\s*INCLUDE_DATA\(\s*"([^"]*)"\s*,\s*([^)\s]+)\s*\)\s*;?\s*$')
SECTION = re.compile(r'^\s*\.section\s+(\.\w+)')
WIDTH = {".word": 4, ".long": 4, ".float": 4, ".short": 2, ".half": 2, ".byte": 1, ".double": 8}
BSS = (".bss", ".sbss")
original = Preprocessor.preprocess_c_file
data_markers = []


def datum(path):
    """(section, size, retail address) of one datum file the split wrote."""
    kind, size, address = None, 0, None
    for line in Path(path).read_text(encoding="utf-8").splitlines():
        m = SECTION.match(line)
        if m:
            kind = m.group(1)
            continue
        if address is None:
            where = re.match(r'^\s*/\*\s*((?:[0-9A-Fa-f]+\s*)+)\*/', line)
            if where:
                numbers = where.group(1).split()
                address = int(numbers[0] if len(numbers) == 1 else numbers[1], 16)
        m = re.match(r'^\s*(?:/\*.*?\*/\s*)?(\.\w+)\s*(.*)$', line)
        if not m:
            continue
        directive, operand = m.groups()
        if directive == ".space":
            size += int(operand.split(",")[0], 0)
        elif directive in WIDTH:
            size += WIDTH[directive] * (operand.count(",") + 1)
        elif directive in (".ascii", ".asciz"):
            size += len(eval(operand)) + (directive == ".asciz")
    if kind is None or size == 0 or address is None:
        raise SystemExit(f"mwccgap_region: {path} holds no datum")
    return kind, size, address


def spelling(name):
    """The name as the compiler can be handed it; mwccgap spells it back."""
    if name.startswith("@"):
        return SYMBOL_AT + name[1:].replace("$", SYMBOL_DOLLAR)
    return name.replace("$", SYMBOL_DOLLAR)


def placeholder(folder, name):
    path = Path(os.environ.get("ASM_DIR", ".")) / folder / f"{name}.s"
    kind, size, address = datum(path)
    data_markers.append((path, name, kind, size, address))
    static = "static " if "$" in name or name.startswith("@") else ""
    body = "" if kind in BSS else " = {" + "1, " * size + "}"
    return ['extern "C" {', f"{static}unsigned char {spelling(name)}[{size}]{body};", "}"]


def preprocess_c_file(self, textio):
    lines = region.active_text(textio.read()).split("\n")
    lines = [MARKER.sub(lambda m: m.group(1) + region.marker_folder(m.group(2)) + m.group(3), line)
             for line in lines]
    out = []
    data_markers.clear()
    for line in lines:
        m = DATA_MARKER.match(line)
        out += placeholder(*m.groups()) if m else [line]
    return original(self, io.StringIO("\n".join(out)))


def option(name, default=None):
    argv = sys.argv[1:]
    return argv[argv.index(name) + 1] if name in argv else default


def assemble(path):
    as_flags = []
    if "--as-flags" in sys.argv:
        as_flags = sys.argv[sys.argv.index("--as-flags") + 1:]
    with tempfile.NamedTemporaryFile(suffix=".o", delete=False) as f:
        out = f.name
    try:
        subprocess.run([option("--as-path", "as"), "-EL", "-march=" + option("--as-march", "r5900"),
                        "-mabi=" + option("--as-mabi", "eabi"), *as_flags, "-o", out, str(path)],
                       check=True)
        return Elf(Path(out).read_bytes())
    finally:
        os.unlink(out)


def transplant(obj):
    """Give each placeholder the datum it stands for."""
    elf = Elf(obj.read_bytes())
    for path, name, kind, size, address in data_markers:
        index = next((s.st_shndx for s in elf.symtab.symbols
                      if s.name == name and 0 < s.st_shndx < len(elf.sections)), None)
        if index is None:
            raise SystemExit(f"mwccgap_region: {obj} has no placeholder for {name}")
        section = elf.sections[index]
        section.sh_name = elf.add_sh_symbol(kind)
        section.name = kind
        # retail's alignment for it: where it sits says as much as it can
        section.sh_addralign = min(16, address & -address)
        if kind in BSS:
            continue
        assembled = assemble(path)
        source = next(i for i, s in enumerate(assembled.sections) if s.name == kind)
        data = assembled.sections[source].data
        if len(data) != size:
            raise SystemExit(f"mwccgap_region: {path} assembles to {len(data)} bytes, not {size}")
        section.data = data
        for record in assembled.get_relocations():
            if record.sh_info != source:
                continue
            record.sh_link = elf.symtab_index
            record.sh_info = index
            record.sh_name = elf.add_sh_symbol(".rel" + kind)
            for relocation in record.relocations:
                symbol = assembled.symtab.symbols[relocation.symbol_index]
                relocation.symbol_index = elf.add_symbol(symbol, force=True)
            elf.add_section(record)
    obj.write_bytes(elf.pack())


Preprocessor.preprocess_c_file = preprocess_c_file

sys.argv[0] = os.path.join(MWCCGAP, "mwccgap.py")
try:
    runpy.run_path(sys.argv[0], run_name="__main__")
except SystemExit as done:
    if done.code:
        raise
if data_markers:
    transplant(Path(sys.argv[2]))
