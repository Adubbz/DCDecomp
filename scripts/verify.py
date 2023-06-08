#!/usr/bin/env python3
import argparse
import hashlib
import sys
from pathlib import Path

ALLOWED_FILES = ['SCUS_971.11', 'DUN.BIN', 'TITLE.BIN']

SCUS_971_11_SHA256 = 'de3015eefbe86dddbd126a122ef60eda0e29cd12b7d2eaf87ed3ad236e11989c'
SCUS_971_11_PARTIAL_SHA256 = 'b128a252266b2e872fcc796ff18e9819a329cd0e0fa90155725793a19bb52c7e'

def calculate_sha256(path, offset, size=-1):
    with open(path, 'rb') as f:
        f.seek(offset)
        data = f.read(size)
        return hashlib.sha256(data).hexdigest()

def validate_hash(name, hash, expected):
    if hash.lower() == expected.lower():
        print(f'{name}: OK')
        return True
    else:
        print(f'{name}: FAILED')
        sys.exit(1)

parser = argparse.ArgumentParser(description='Verify decompiled files')
parser.add_argument('file')
parser.add_argument('-p', '--partial', dest='partial', action='store_true')
args = parser.parse_args()

path = Path(args.file)

if not path.name in ALLOWED_FILES:
    f'Invalid file {path}'
    sys.exit(1)

if path.name == 'SCUS_971.11':
    if args.partial:
        validate_hash(f'{path.name} (partial)', SCUS_971_11_PARTIAL_SHA256, calculate_sha256(path, 0x100, 0x1A2380))
    else:
        validate_hash(path.name, SCUS_971_11_SHA256, calculate_sha256(path, 0x0))
