#!/usr/bin/env python3
"""Write built files back into a copy of the retail ISO.

The ISO is copied and then patched in place rather than mastered from scratch.
The game reads several of its own files by absolute sector, so every file we
are not replacing has to keep the LBA it shipped with; re-mastering would
renumber them.

pycdlib is used only to locate each file. The bytes are then written straight
to that location, so the volume descriptors, path tables and directory records
come through completely untouched -- the output differs from the retail ISO
only in the data sectors of the files actually replaced.

Keeping the directory records untouched means a replacement has to fit the
length already recorded for it, and is zero-padded up to that length if it is
shorter. That only bites when a built file outgrows its retail counterpart,
which is exactly when it should be reported.

Usage:
    make_iso.py --source <retail.iso> --out <built.iso> <file> [<file> ...]

Each file is matched to the ISO record with the same name.
"""
import argparse
import os
import shutil
import subprocess
import sys

import pycdlib

SECTOR = 2048


def locate(source, names):
    """Return {name: (extent, length)} for each wanted file on the ISO."""
    iso = pycdlib.PyCdlib()
    iso.open(source)
    try:
        found = {}
        for dirname, _, files in iso.walk(iso_path='/'):
            for entry in files:
                name = entry.split(';')[0].rstrip('.')
                if name not in names:
                    continue
                record = iso.get_record(
                    iso_path=f'{dirname.rstrip("/")}/{entry}')
                found[name] = (record.extent_location(),
                               record.get_data_length())
        return found
    finally:
        iso.close()


def copy_iso(source, out):
    """Copy the ISO, preferring a reflink so it costs nothing on CoW filesystems."""
    os.makedirs(os.path.dirname(out) or '.', exist_ok=True)
    try:
        subprocess.run(['cp', '--reflink=auto', source, out], check=True)
    except (OSError, subprocess.CalledProcessError):
        shutil.copyfile(source, out)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--source', required=True)
    ap.add_argument('--out', required=True)
    ap.add_argument('files', nargs='+')
    args = ap.parse_args()

    wanted = {os.path.basename(f): f for f in args.files}
    located = locate(args.source, set(wanted))

    missing = set(wanted) - set(located)
    if missing:
        sys.exit(f'not present on {args.source}: {", ".join(sorted(missing))}')

    patches = []
    for name, local in wanted.items():
        extent, length = located[name]
        with open(local, 'rb') as f:
            data = f.read()
        if len(data) > length:
            sys.exit(f'{local} is {len(data)} bytes but only {length} are '
                     f'recorded for {name} on the ISO; it no longer fits.')
        patches.append((name, local, extent, data.ljust(length, b'\0')))

    copy_iso(args.source, args.out)

    with open(args.out, 'r+b') as iso:
        for name, local, extent, data in patches:
            iso.seek(extent * SECTOR)
            iso.write(data)
            print(f'  {name} @ LBA {extent}: patched from {local}')

    print(f'Wrote {args.out}')


if __name__ == '__main__':
    main()
