import argparse
import os
import pycdlib
import sys
from pathlib import Path

# Constants
COLOR_GREEN = '\033[92m'
COLOR_END = '\033[0m'

# Directories
ISO_PATH = Path('rom/Dark Cloud (USA).iso')
EXTRACT_DIR = Path('rom/extracted')
ISO_EXTRACT_DIR = EXTRACT_DIR / 'iso'

# Files
ELF_PATH = ISO_EXTRACT_DIR / 'SCUS_971.11'

def assert_exists(path):
    if not path.exists():
        sys.exit(f'{path} does not exist! Ensure you have run make extract.')

def ensure_dir(path):
    path.mkdir(parents=True, exist_ok=True)

def collect_entries(iso, parent_iso_path, extract_dir_path, entries):
    """Every file in the image, as (iso path, destination, size)."""
    for child in iso.list_children(iso_path=parent_iso_path):
        identifier = child.file_identifier().decode()
        absolute_iso_path = f'{parent_iso_path}{identifier}'

        # Skip . and .. directories
        if identifier in ['.', '..']:
            continue

        # Recurse directories or collect files
        if child.is_dir():
            collect_entries(iso, f'{absolute_iso_path}/',
                            extract_dir_path / identifier, entries)
        else:
            file_name = identifier.split(';')[0]

            # Strip empty file extensions (e.g. DMMY. -> DMMY)
            if file_name.endswith('.'):
                file_name = file_name[:-1]

            entries.append((absolute_iso_path,
                            extract_dir_path / file_name,
                            child.get_data_length()))

def is_current(file_path, size):
    """Whether this file was already extracted from the image at hand.

    Size alone settles it: the image's own sha256 is checked before anything
    is extracted from it, and `verify.py -e` hashes what came out, so the one
    thing this has to catch is a file that is missing or was written by an
    interrupted run.
    """
    try:
        return file_path.stat().st_size == size
    except OSError:
        return False

def prune(entries):
    """Drop files the image no longer has, left by an earlier extraction."""
    wanted = {path.resolve() for _iso_path, path, _size in entries}
    removed = 0
    for path in ISO_EXTRACT_DIR.rglob('*'):
        if path.is_file() and path.resolve() not in wanted:
            path.unlink()
            removed += 1
    return removed

def read_bytes(fp, offset, size):
    fp.seek(offset)
    return fp.read(size)

def extract_bin(fp, out_name, offset, size):
    with open(out_name, 'wb') as f:
        f.write(read_bytes(fp, offset, size))

def extract_iso(force=False):
    # Ensure the original ISO exists
    if not ISO_PATH.exists():
        sys.exit('ISO does not exist!\nEnsure Dark Cloud (USA).iso is placed within your rom directory.')

    # Create extraction directories
    ensure_dir(ISO_EXTRACT_DIR)

    # Open the iso for reading
    iso = pycdlib.PyCdlib()
    iso.open(ISO_PATH)

    # Extract the contents of the iso. What is already there is left alone:
    # this is 1.7GB, most of it DATA.DAT, and every build would otherwise
    # write the whole of it again.
    print('Extracting ISO contents', flush=True)
    entries = []
    collect_entries(iso, '/', ISO_EXTRACT_DIR, entries)

    kept = 0
    for absolute_iso_path, file_path, size in entries:
        if not force and is_current(file_path, size):
            kept += 1
            continue

        # Ensure the parent directory exists
        ensure_dir(file_path.parent)

        # Write the output file
        print(f'  {absolute_iso_path}: ', end='', flush=True)
        iso.get_file_from_iso(file_path, iso_path=absolute_iso_path)
        print(f'{COLOR_GREEN}DONE{COLOR_END}', flush=True)

    # Close the iso
    iso.close()

    stale = prune(entries)
    print(f'Extracted {len(entries) - kept} file(s); {kept} already present, '
          f'{stale} stale file(s) removed', flush=True)

if __name__ == "__main__":
    # Change to work from the root directory
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir, os.pardir))
    os.chdir(root_dir)

    parser = argparse.ArgumentParser(description='Utilities for extracting files for decompilation')
    parser.add_argument('-f', '--force', action='store_true',
                        help='Extract every file again, rather than only what is missing')
    args = parser.parse_args()

    extract_iso(args.force)
