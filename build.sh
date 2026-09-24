#!/usr/bin/env bash
# Build everything and leave the results in build/. Use run.sh instead if you
# want the disc image as well, booted in PCSX2.
#
# On the host this runs the build in the dev container with the working tree
# mounted; inside a container it drives the same targets against the tree.
#
#   ./build.sh              build what has changed since the last run
#   CLEAN=1 ./build.sh      throw build/ away first, so everything is rebuilt
#   JOBS=8 ./build.sh       run 8 jobs rather than one per CPU
#
# What was extracted from the disc survives CLEAN: it is checked against the
# disc rather than against a stamp. `scripts/build/extract.py --force` is the
# way to write it out again.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

require_rom

# The build itself, the same inside a container as through the one started
# below. CLEAN discards build/ under the lock every build of the tree takes
# (see scripts/build/cmake.sh), so it cannot pull the directory out from under
# a build objdiff started. Verification only reports -- an unmatched build
# still leaves its output.
BUILD='
    set -e
    if [ "${CLEAN:-0}" = 1 ]; then
        echo "CLEAN=1: discarding build/; everything in it is built again."
        flock .build.lock rm -rf build
    fi
    scripts/build/cmake.sh elf ctx
    scripts/build/verify_built.sh
'

if in_container; then
    exec sh -c "$BUILD"
fi

# The image holds only the toolchain, so it is built once and reused; the tree
# is mounted rather than copied in, which is what keeps the extracted disc
# (rom/), the split (asm/) and every object (build/) between runs. Set
# REBUILD_IMAGE=1 after editing the Dockerfile.
require_builder
ensure_image dcdecomp_dev dev
report_parallelism

# bash 3.2, which is what macOS ships, treats an empty array as unset under
# `set -u`, hence the guarded expansions below.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

# CLEAN and JOBS are for the build inside the container.
ENV_ARGS=(-e "CLEAN=${CLEAN:-0}")
if [ -n "${JOBS:-}" ]; then ENV_ARGS+=(-e "JOBS=$JOBS"); fi

"$BUILDER" run --rm ${TTY[@]+"${TTY[@]}"} "${ENV_ARGS[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev sh -c "$BUILD"
