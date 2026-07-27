#!/usr/bin/env bash
# Build the game in the container, then boot it in PCSX2. One command, from a
# clean checkout to the title screen.
#
#   run.sh
#
# The first run also builds the container image and extracts and disassembles
# the disc, which takes a while; every run after that is incremental, because
# the working tree is mounted into the container rather than copied into the
# image.
#
# PCSX2 runs on the host, not in the container -- it needs a display. Set
# PCSX2=/path/to/pcsx2-qt if it is not found automatically.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/container.sh

require_rom
ensure_image dcdecomp_dev dev

ISO="build/Dark Cloud (Build).iso"

# `cmake --build build` verifies against the retail hashes; a mismatch is worth
# reporting but should not stop you booting a work-in-progress build.
# Mounted at its own path, not a fixed one, so the CMake cache in build/ stays
# valid whether you go through this script or run cmake in the container
# yourself.
"$BUILDER" run --rm \
    -v "$PWD:$PWD:Z" \
    -w "$PWD" \
    -e HOME=/tmp \
    dcdecomp_dev bash -c '
        set -e
        cmake -G Ninja -S . -B build
        if [ ! -d ref ]; then
            echo "First run: extracting and disassembling the disc."
            cmake --build build --target setup
            cmake -G Ninja -S . -B build
        fi
        cmake --build build || echo "WARNING: the build does not match retail."
        cmake --build build --target iso
    '

exec scripts/pcsx2.sh "$ISO"
