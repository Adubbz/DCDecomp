import argparse
import os
import pycdlib
import shutil
import sys
from pathlib import Path

# Constants
COLOR_GREEN = '\033[92m'
COLOR_END = '\033[0m'

# Directories
ISO_PATH = Path('rom/Dark Cloud (USA).iso')
EXTRACT_DIR = Path('extracted')
ISO_EXTRACT_DIR = EXTRACT_DIR / 'iso'
VU_EXTRACT_DIR = EXTRACT_DIR / 'vu'

# Files
ELF_PATH = ISO_EXTRACT_DIR / 'SCUS_971.11'

# VU programs
VU_PROG0_PATH = VU_EXTRACT_DIR / 'Vu_prog0.bin'
VU_PROG0F_PATH = VU_EXTRACT_DIR / 'Vu_prog0f.bin'
VU_PROG1_PATH = VU_EXTRACT_DIR / 'Vu_prog1.bin'
VU_PROGG_PATH = VU_EXTRACT_DIR / 'Vu_progg.bin'
VU_SHADOW_PATH = VU_EXTRACT_DIR / 'Vu_shadow.bin'
VU_SHADOW2_PATH = VU_EXTRACT_DIR / 'Vu_shadow2.bin'
VU_SHADOW3_PATH = VU_EXTRACT_DIR / 'Vu_shadow3.bin'
VU_PROGMAIN_PATH = VU_EXTRACT_DIR / 'Vu_progmain.bin'

def assert_exists(path):
    if not path.exists():
        sys.exit(f'{path} does not exist! Ensure you have run make extract.')

def ensure_dir(path):
    path.mkdir(parents=True, exist_ok=True)

def extract_recursive(iso, parent_iso_path, extract_dir_path):
    for child in iso.list_children(iso_path=parent_iso_path):
        identifier = child.file_identifier().decode()
        absolute_iso_path = f'{parent_iso_path}{identifier}'

        # Skip . and .. directories
        if identifier in ['.', '..']:
            continue

        # Recurse directories or extract files
        if child.is_dir():
            extract_recursive(iso, f'{absolute_iso_path}/', extract_dir_path / identifier)
        else:
            file_name = identifier.split(';')[0]

            # Strip empty file extensions (e.g. DMMY. -> DMMY)
            if file_name.endswith('.'):
                file_name = file_name[:-1]

            file_path = extract_dir_path / file_name

            # Ensure the parent directory exists
            ensure_dir(extract_dir_path)

            # Write the output file
            print(f'  {absolute_iso_path}: ', end='', flush=True)
            iso.get_file_from_iso(file_path, iso_path=f'{absolute_iso_path}')
            print(f'{COLOR_GREEN}DONE{COLOR_END}', flush=True)

def read_bytes(fp, offset, size):
    fp.seek(offset)
    return fp.read(size)

def extract_bin(fp, out_name, offset, size):
    with open(out_name, 'wb') as f:
        f.write(read_bytes(fp, offset, size))

def extract_iso():
    # Ensure the original ISO exists
    if not ISO_PATH.exists():
        sys.exit('ISO does not exist!\nEnsure Dark Cloud (USA).iso is placed within your rom directory.')

    # Clean original extraction directory
    if EXTRACT_DIR.exists():
        shutil.rmtree(EXTRACT_DIR)

    # Create extraction directories
    ensure_dir(ISO_EXTRACT_DIR)
    ensure_dir(VU_EXTRACT_DIR)

    # Open the iso for reading
    iso = pycdlib.PyCdlib()
    iso.open(ISO_PATH)

    # Extract the contents of the iso
    print('Extracting ISO contents', flush=True)
    extract_recursive(iso, '/', ISO_EXTRACT_DIR)

    # Close the iso
    iso.close()

    print('Extracting elf data', flush=True)

    # Open elf file for reading
    with open(ELF_PATH, 'rb') as f:
        # Extract vu programs
        extract_bin(f, VU_PROG0_PATH,    0x145400, 0xE00)
        extract_bin(f, VU_PROG0F_PATH,   0x146200, 0x2800)
        extract_bin(f, VU_PROG1_PATH,    0x148A00, 0xED0)
        extract_bin(f, VU_PROGG_PATH,    0x1498D0, 0x130)
        extract_bin(f, VU_SHADOW_PATH,   0x149A00, 0x1D70)
        extract_bin(f, VU_SHADOW2_PATH,  0x14B770, 0x2580)
        extract_bin(f, VU_SHADOW3_PATH,  0x14DCF0, 0x1D70)
        extract_bin(f, VU_PROGMAIN_PATH, 0x14FA60, 0x160)

if __name__ == "__main__":
    # Change to work from the root directory
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
    os.chdir(root_dir)

    parser = argparse.ArgumentParser(description='Utilities for extracting files for decompilation')
    args = parser.parse_args()

    extract_iso()