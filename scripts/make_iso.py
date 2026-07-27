#!/usr/bin/env python3
"""Master a fresh ISO from the extracted disc, with the built files swapped in.

Every file comes from rom/extracted, except the ones named on the command
line, which are taken from the build instead. Because the image is mastered
rather than patched, a built file is under no obligation to be the same size
as the one it replaces -- it is simply laid down and the directory records
describe wherever it lands.

The layout is rebuilt from scratch, so files do not keep the sectors they
shipped on. The game opens its files by name through the CD filesystem, and
the offsets inside DATA.HED are relative to DATA.DAT rather than to the disc,
so nothing depends on the old sector numbers.

The naming and the volume identifiers are taken from the retail ISO rather
than guessed, so the new image describes itself the same way: ISO9660 names
carry their `;1` version, and the UDF tree keeps the original mixed case
(title.bin against ISO9660's TITLE.BIN).

Usage:
    make_iso.py --source <retail.iso> --tree <extracted dir> --out <built.iso>
                [<replacement file> ...]
"""
import argparse
import os
import sys

import pycdlib

# pycdlib writes this revision; the retail disc predates it, but the PS2 reads
# the ISO9660 tree and both are present either way.
UDF_VERSION = '2.60'


def ident(pvd, name):
    """Read one of the PVD's identifier fields as text."""
    value = getattr(pvd, name)
    if hasattr(value, 'record'):
        value = value.record()
    if isinstance(value, (bytes, bytearray)):
        value = value.decode('latin-1')
    return value.rstrip(' \x00')


def strip_version(iso_path):
    """`/CONF/NET/NET.DB;1` -> `/CONF/NET/NET.DB`, the name as extracted."""
    return iso_path.split(';')[0].rstrip('.')


def read_layout(source):
    """Return the volume identifiers and the directory/file lists of a disc."""
    iso = pycdlib.PyCdlib()
    iso.open(source)
    try:
        volume = {
            'sys_ident': ident(iso.pvd, 'system_identifier'),
            'vol_ident': ident(iso.pvd, 'volume_identifier'),
            'app_ident_str': ident(iso.pvd, 'application_identifier'),
            'pub_ident_str': ident(iso.pvd, 'publisher_identifier'),
            'preparer_ident_str': ident(iso.pvd, 'preparer_identifier'),
        }

        # The UDF tree names the same objects in their original case, so index
        # it by upper-cased path to pair each one with its ISO9660 name.
        udf = {}
        if iso.has_udf():
            for dirname, dirs, files in iso.walk(udf_path='/'):
                base = dirname.rstrip('/')
                for entry in dirs + files:
                    path = f'{base}/{entry}'
                    udf[path.upper()] = path

        directories, files = [], []
        for dirname, subdirs, entries in iso.walk(iso_path='/'):
            base = dirname.rstrip('/')
            for entry in subdirs:
                directories.append(f'{base}/{entry}')
            for entry in entries:
                files.append(f'{base}/{entry}')
        return volume, directories, files, udf
    finally:
        iso.close()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--source', required=True, help='the retail ISO, read for its layout')
    ap.add_argument('--tree', required=True, help='directory the disc was extracted to')
    ap.add_argument('--out', required=True)
    ap.add_argument('files', nargs='*', help='built files to use instead of the extracted ones')
    args = ap.parse_args()

    replacements = {os.path.basename(f): f for f in args.files}
    volume, directories, files, udf = read_layout(args.source)

    on_disc = {os.path.basename(strip_version(p)) for p in files}
    unknown = set(replacements) - on_disc
    if unknown:
        sys.exit(f'not present on the disc: {", ".join(sorted(unknown))}')

    iso = pycdlib.PyCdlib()
    iso.new(interchange_level=1, udf=UDF_VERSION, **volume)

    # Parents before children, so every directory exists before it is filled.
    for path in sorted(directories, key=lambda p: p.count('/')):
        iso.add_directory(iso_path=path, udf_path=udf.get(path.upper()))

    for iso_path in files:
        name = strip_version(iso_path)
        local = replacements.get(os.path.basename(name))
        if not local:
            local = os.path.join(args.tree, name.lstrip('/'))
        if not os.path.isfile(local):
            sys.exit(f'{local} is missing; extract the disc first.')

        iso.add_file(local, iso_path=iso_path, udf_path=udf.get(name.upper()))

    for name in sorted(replacements):
        print(f'  {name}: from {replacements[name]}')

    os.makedirs(os.path.dirname(args.out) or '.', exist_ok=True)
    iso.write(args.out)
    iso.close()

    print(f'Wrote {args.out} ({os.path.getsize(args.out)} bytes)')


if __name__ == '__main__':
    main()
