#!/usr/bin/env python3
"""Apply symbol-derived and configured fixes to a compiled object."""

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).parents[2]
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(ROOT / "tools" / "mwccgap"))

from mwccgap.elf import Elf  # noqa: E402
from scripts.build import disassemble  # noqa: E402


LOCAL_STATIC = re.compile(r"^(.+)\$(\d+)$")
STATIC_RELOCATION = re.compile(r"%(?:gp_rel|hi|lo)\(([^)]+\$\d+)\)")


def local_static_aliases(elf, source):
    """Pair MWCC local statics with the retail names used by their unit."""
    unit = next(
        (row for row in disassemble.read_units() if row[2] == source), None
    )
    if unit is None or not Path(unit[3]).exists():
        return {}

    _kind, _image, _source, reference = unit
    text = Path(reference).read_text(encoding="utf-8")
    text = disassemble.restore_gp_relative_relocations(
        Path(reference), text, disassemble.read_symbol_table(),
        disassemble.image_of_file())
    retail = set(STATIC_RELOCATION.findall(text))
    compiled_groups = defaultdict(list)
    retail_groups = defaultdict(list)
    for symbol in elf.symtab.symbols:
        match = LOCAL_STATIC.match(symbol.name)
        if match:
            compiled_groups[match.group(1)].append(symbol.name)
    for name in retail:
        match = LOCAL_STATIC.match(name)
        if match:
            retail_groups[match.group(1)].append(name)

    aliases = {}
    for key, compiled in compiled_groups.items():
        expected = retail_groups.get(key, [])
        if len(compiled) != len(expected):
            continue
        compiled.sort(key=lambda name: int(LOCAL_STATIC.match(name).group(2)))
        expected.sort(key=lambda name: int(LOCAL_STATIC.match(name).group(2)))
        aliases.update(
            (old, new) for old, new in zip(compiled, expected) if old != new
        )
    return aliases


def rename_sections(elf, mappings, parser):
    """Rename the sections that define configured symbols."""
    symbols = {symbol.name: symbol for symbol in elf.symtab.symbols}
    renamed = {}
    for section_name, names in mappings.items():
        name_index = elf.add_sh_symbol(section_name)
        for symbol_name in names:
            symbol = symbols.get(symbol_name)
            if symbol is None:
                parser.error(f"{symbol_name!r} is not defined")
            index = symbol.st_shndx
            if index in renamed and renamed[index] != section_name:
                parser.error(f"section {index} has conflicting names")
            elf.sections[index].sh_name = name_index
            elf.sections[index].name = section_name
            renamed[index] = section_name


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("object", type=Path)
    parser.add_argument("source")
    parser.add_argument("--config", type=Path,
                        default=ROOT / "config" / "object_fixups.json")
    args = parser.parse_args()

    elf = Elf(args.object.read_bytes())
    aliases = local_static_aliases(elf, args.source)
    for symbol in elf.symtab.symbols:
        replacement = aliases.get(symbol.name)
        if replacement:
            symbol.name = replacement
            symbol.st_name = elf.strtab.add_symbol(replacement)

    config = json.loads(args.config.read_text(encoding="utf-8"))
    rename_sections(elf, config.get(args.source, {}).get("sections", {}), parser)
    args.object.write_bytes(elf.pack())


if __name__ == "__main__":
    main()
