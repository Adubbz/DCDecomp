#!/usr/bin/env bash
# Build everything and leave the results in build/. Use run.sh instead if you
# want an incremental build that also boots the result.
#
# On the host this builds a container image from a clean copy of the tree and
# runs it; inside a container it drives the same targets against the tree.
#
#   ./build.sh              build what has changed since the last run
#   CLEAN=1 ./build.sh      throw build/ away first, so everything is rebuilt
#   JOBS=8 ./build.sh       override the job count ninja picks for itself
#
# What was extracted from the disc survives CLEAN: it is checked against the
# disc rather than against a stamp. `scripts/build/extract.py --force` is the
# way to write it out again.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

require_rom

if in_container; then
    # The image's own build stage runs exactly these targets and the same
    # verification, through the same scripts; the difference is that it gets a
    # pristine copy of the sources, while this builds the tree as it stands.
    # Verification only reports -- an unmatched build still leaves its output.
    echo "Already inside the container: building the working tree in place."
    scripts/build/cmake.sh elf ctx
    exec scripts/build/verify_built.sh
fi

require_builder

# Always rebuilt: this stage copies the tree into the image, so a stale image
# would build stale sources. Only that copy is rebuilt -- the toolchain stages
# under it are cached, and the sources are the last thing the image adds.
"$BUILDER" build -t dcdecomp_build --target build .

if [ "${CLEAN:-0}" = 1 ]; then
    echo "CLEAN=1: discarding build/; everything in it is built again."
    rm -rf build
fi
mkdir -p build asm

report_parallelism

# bash 3.2, which is what macOS ships, treats an empty array as unset under
# `set -u`, hence the guarded expansions below.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

# JOBS, when it is set, is for scripts/build/cmake.sh inside the container.
ENV_ARGS=()
if [ -n "${JOBS:-}" ]; then ENV_ARGS=(-e "JOBS=$JOBS"); fi

# The image carries a clean copy of the sources; the three generated
# directories are mounted instead, and are what make a second run cheap.
#
#   rom/    the 1.7GB disc and what was extracted from it, which would
#           otherwise be extracted again into a fresh image every run
#   asm/    the split. Its stamp lives in build/, so the split it describes
#           has to be the one the next run reads -- and a re-split here
#           persists exactly as it does through run.sh
#   build/  the stamps and every object, so only what changed is rebuilt.
#           The results land here directly
#
# -t keeps the colours and progress line, skipped when this script's own
# output is redirected.
"$BUILDER" run --rm ${TTY[@]+"${TTY[@]}"} ${ENV_ARGS[@]+"${ENV_ARGS[@]}"} \
  -v "$(pwd)/rom:$CONTAINER_WORKDIR/rom:Z" \
  -v "$(pwd)/asm:$CONTAINER_WORKDIR/asm:Z" \
  -v "$(pwd)/build:$CONTAINER_WORKDIR/build:Z" \
  dcdecomp_build
