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

# -t keeps the colours and progress line, skipped when this script's own output
# is redirected.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

# The image is built first and on its own: the `iso` target is deliberately not
# tied to the hash check, so code that does not match retail still boots, which
# is the whole point of running it. `set -e` matters here -- if that step fails
# the run has to stop, or the emulator boots whatever stale image is lying
# around. Only the match report afterwards is allowed to fail.
"$BUILDER" run --rm "${TTY[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev sh -c '
        set -e
        scripts/build/cmake.sh iso
        scripts/build/cmake.sh build \
            || echo "WARNING: this build does not match retail; booting it anyway." >&2
    '

exec scripts/host/pcsx2.sh "$ISO"
