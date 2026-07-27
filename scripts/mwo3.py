#!/usr/bin/env python3
"""Stamp the MWo3 overlay header onto a linked overlay image.

MWLD 2.3.1.01 lays an overlay region out correctly and writes it to its own
file, but does not write the 64-byte MWo3 header that the game's overlay loader
(mwLoadOverlay / MWNotifyOverlayLoaded in the main ELF) expects. The linker
command file reserves those 64 bytes at the start of the region, so the image
already has the retail addresses; this fills the reservation in and pads the
file to the 128-byte boundary the retail images are padded to.

Every field is read back from the symbols the linker command file defines
around the placement, so nothing here is hardcoded per overlay:

    _<name>_load          region origin, i.e. the header's own address
    _<name>_text/_data    section starts
    _<name>_bss/_end      section starts/end, giving each section its size
    _<name>_static_init   static-initialiser table, labelled in the
    _<name>_static_init_end    reference data dumps

Usage:
    mwo3.py --elf <linked.elf> --name <title> --id <1> <overlay.bin>
"""
import argparse
import struct
import sys

HEADER_SIZE = 0x40
NAME_OFFSET = 0x20
FILE_ALIGN = 128


def read_symbols(path):
    """Return {name: value} for an ELF32 little-endian symbol table."""
    with open(path, 'rb') as f:
        data = f.read()

    if data[:4] != b'\x7fELF' or data[4] != 1 or data[5] != 1:
        sys.exit(f'{path} is not a 32-bit little-endian ELF')

    e_shoff, = struct.unpack_from('<I', data, 0x20)
    e_shentsize, e_shnum = struct.unpack_from('<HH', data, 0x2E)

    symbols = {}
    for i in range(e_shnum):
        off = e_shoff + i * e_shentsize
        sh_type, = struct.unpack_from('<I', data, off + 4)
        if sh_type != 2:  # SHT_SYMTAB
            continue
        sh_offset, sh_size, sh_link, _, _, sh_entsize = struct.unpack_from(
            '<6I', data, off + 0x10)
        str_off, = struct.unpack_from(
            '<I', data, e_shoff + sh_link * e_shentsize + 0x10)

        for j in range(sh_size // sh_entsize):
            st = sh_offset + j * sh_entsize
            st_name, st_value = struct.unpack_from('<II', data, st)
            if not st_name:
                continue
            end = data.index(b'\0', str_off + st_name)
            symbols[data[str_off + st_name:end].decode()] = st_value
    return symbols


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--elf', required=True, help='the ELF the overlay was linked with')
    ap.add_argument('--name', required=True, help='overlay name, e.g. title')
    ap.add_argument('--id', type=int, required=True, help='overlay index, 1-based')
    ap.add_argument('image')
    args = ap.parse_args()

    syms = read_symbols(args.elf)

    def sym(suffix):
        key = f'_{args.name}_{suffix}'
        if key not in syms:
            sys.exit(f'{args.elf} does not define {key}; the linker command '
                     f'file must mark the {args.name} overlay boundaries.')
        return syms[key]

    load = sym('load')
    text, data, bss, end = (sym(s) for s in ('text', 'data', 'bss', 'end'))
    sinit, sinit_end = sym('static_init'), sym('static_init_end')

    with open(args.image, 'rb') as f:
        image = bytearray(f.read())

    if len(image) < HEADER_SIZE or any(image[:HEADER_SIZE]):
        sys.exit(f'{args.image} does not start with {HEADER_SIZE} reserved '
                 f'bytes for the header.')

    header = struct.pack('<4s7I', b'MWo3', args.id, load,
                         data - text, bss - data, end - bss, sinit, sinit_end)
    image[:len(header)] = header
    name = f'{args.name}.bin'.encode()
    image[NAME_OFFSET:NAME_OFFSET + len(name)] = name

    # Retail pads each overlay image out to a 128-byte boundary.
    image += b'\0' * (-len(image) % FILE_ALIGN)

    with open(args.image, 'wb') as f:
        f.write(image)

    print(f'{args.image}: overlay {args.id} "{name.decode()}" at 0x{load:08X} '
          f'(text 0x{data - text:X}, data 0x{bss - data:X}, bss 0x{end - bss:X})')


if __name__ == '__main__':
    main()
