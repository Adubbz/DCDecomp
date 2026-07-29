#!/usr/bin/env bash
# Build the game in the container, then boot it in PCSX2. One command, from a
# clean checkout to the title screen.
#
#   run.sh
#
# The first run builds the image and extracts and disassembles the disc; later
# runs are incremental, since the tree is mounted rather than copied in. PCSX2
# runs on the host (it needs a display); set PCSX2=/path/to/pcsx2-qt if needed.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

# PCSX2 is the reason this one is host-only: it needs a display, so there is
# nothing sensible for it to do from inside the container.
require_builder
require_rom
ensure_image dcdecomp_dev dev

ISO="build/Dark Cloud (Build).iso"

# The default target verifies against the retail hashes, and is allowed to fail
# so a work-in-progress build still boots. -t keeps the colours and progress
# line, skipped when this script's own output is redirected.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

"$BUILDER" run --rm "${TTY[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev sh -c '
        scripts/build/cmake.sh build || echo "WARNING: the build does not match retail."
        scripts/build/cmake.sh iso
    '

exec scripts/host/pcsx2.sh "$ISO"
