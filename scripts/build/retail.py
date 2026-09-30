"""Retail's bytes, read from the disc's own files by address.

The reference assembly splat writes under asm/ is retail's bytes too, but only
as text and only once the split has run. The build reads what it needs to know
about retail -- a constant's bytes, the instruction a literal load sits in --
from the images themselves, so compiling the game's code needs nothing under
asm/.

    read(image, address, size) -> bytes

`image` is 'main', 'title' or 'dun'. main is an ELF whose loadable segments
say where each byte goes; the overlays are raw images loaded at one address.
"""

import functools
import os
import struct
import sys
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import region  # noqa: E402

ROOT = Path(__file__).resolve().parents[2]
ISO = ROOT / region.EXTRACTED_ISO
FILES = {"main": "SCUS_971.11", "title": "TITLE.BIN", "dun": "DUN.BIN"}
OVERLAY_ORIGIN = region.OVERLAY_ORIGIN


@functools.lru_cache(maxsize=None)
def _image(image):
    """[(address, bytes)] for every loaded run of one image."""
    data = (ISO / FILES[image]).read_bytes()
    if image != "main":
        return [(OVERLAY_ORIGIN, data)]
    phoff, = struct.unpack_from("<I", data, 0x1C)
    phentsize, phnum = struct.unpack_from("<HH", data, 0x2A)
    runs = []
    for i in range(phnum):
        p_type, p_offset, p_vaddr, _paddr, p_filesz, _memsz, _flags, _align = \
            struct.unpack_from("<8I", data, phoff + i * phentsize)
        # main's program headers also describe the overlays' load slot, with
        # nothing in the file behind it.
        if p_type == 1 and p_filesz:
            runs.append((p_vaddr, data[p_offset:p_offset + p_filesz]))
    return runs


def read(image, address, size):
    """`size` bytes of `image` from `address`, or None where it holds none."""
    for start, blob in _image(image):
        if start <= address and address + size <= start + len(blob):
            return blob[address - start:address - start + size]
    return None


def word(image, address):
    """The little-endian word at `address`, or None."""
    blob = read(image, address, 4)
    return None if blob is None else int.from_bytes(blob, "little")
