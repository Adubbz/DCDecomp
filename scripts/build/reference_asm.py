#!/usr/bin/env python3
"""Dump the functions splat does not file one to a file.

    reference_asm.py

`scripts/build/literals.py` reads retail's instructions for a function out of
the dump splat files under its own name. The compiler-generated static
initialisers have no such file: an overlay's `.tinit` is one splat segment
holding every unit's `__sinit_<unit>.cpp`, and once the overlay's initialisers
come from the sources there is no segment at all. Without retail's words the
literal a `__sinit` loads binds to the first pool entry of that value rather
than the one retail used.

These dumps are written under `config/`, not `asm/`, because splat rewrites
`asm/` from the disc on every configure and removes what it did not put there.
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# The overlays are raw binaries loaded at one address; a file offset is the
# address less this. Both share it -- they are alternatives, never resident
# together.
OVERLAY_BASE = 0x01DABD00
IMAGES = {'title': 'rom/extracted/iso/TITLE.BIN',
          'dun': 'rom/extracted/iso/DUN.BIN'}
OUT = 'config/reference_asm'
ENTRY = re.compile(
    r'^(__sinit_\S+) = 0x([0-9a-fA-F]+); // type:func size:0x([0-9a-fA-F]+)')


def main():
    for image, path in IMAGES.items():
        blob = open(path, 'rb').read()
        with open('config/%s.symbols.txt' % image) as f:
            for line in f:
                m = ENTRY.match(line)
                if not m:
                    continue
                name, vram, size = m.group(1), int(m.group(2), 16), int(
                    m.group(3), 16)
                if vram < OVERLAY_BASE:
                    continue
                unit = name[len('__sinit_'):].rsplit('.cpp', 1)[0]
                directory = os.path.join(OUT, image, unit)
                os.makedirs(directory, exist_ok=True)
                offset = vram - OVERLAY_BASE
                out = ['.section .text\n\nglabel %s\n' % name]
                for i in range(0, size, 4):
                    word = blob[offset + i:offset + i + 4]
                    out.append('/* %06X %08X %s */ .word 0x%08X\n'
                               % (offset + i, vram + i, word.hex().upper(),
                                  int.from_bytes(word, 'little')))
                with open(os.path.join(directory, name + '.s'), 'w') as f2:
                    f2.write(''.join(out))
                print(name, hex(vram), size)


if __name__ == '__main__':
    main()
