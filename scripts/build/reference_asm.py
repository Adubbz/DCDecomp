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

The build writes them right after the split, into the release's own split
tree (`asm/<release>/reference`), which is never committed: splat clears that
tree before it splits, and this puts them back from the same binaries.
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import region  # noqa: E402

# The overlays are raw binaries loaded at one address; a file offset is the
# address less this. Both share it -- they are alternatives, never resident
# together.
OVERLAY_BASE = region.OVERLAY_ORIGIN
IMAGES = {'title': region.EXTRACTED_ISO + '/TITLE.BIN',
          'dun': region.EXTRACTED_ISO + '/DUN.BIN'}
OUT = region.REFERENCE
ENTRY = re.compile(
    r'^(__sinit_\S+) = 0x([0-9a-fA-F]+); // type:func size:0x([0-9a-fA-F]+)')


def main():
    written = 0
    for image, path in IMAGES.items():
        blob = open(path, 'rb').read()
        with open('%s/%s.symbols.txt' % (region.CONFIG, image)) as f:
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
                written += 1
    print(f'reference_asm: wrote {written} static initialiser(s) under {OUT}')


if __name__ == '__main__':
    main()
