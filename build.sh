#!/usr/bin/env bash
# Build PS2 by default, or a native Linux/macOS port using its CMake preset.
# PS2 and Linux build in the dev container; macOS builds on the host.
# PS2 results go in ps2/build/ntsc (ps2/build/pal for the PAL prototype). Use run.sh
# instead if you want the disc image as well, booted in PCSX2.
#
# On the host this runs the build in the dev container with the working tree
# mounted; inside a container it drives the same targets against the tree.
#
#   ./build.sh              build what has changed since the last run
#   ./build.sh ps2          explicitly select the default PS2 build
#   ./build.sh linux-x64    build the native Linux port in port/build/pc
#   ./build.sh macos        build the Apple Silicon port in port/build/macos-arm64
#   CLEAN=1 ./build.sh      throw ps2/build/ntsc away first, so everything is rebuilt
#   JOBS=8 ./build.sh       run 8 jobs rather than one per CPU
#   REGION=PAL ./build.sh   build the July 12, 2001 PAL prototype instead
#
# What was extracted from the disc survives CLEAN: it is checked against the
# disc rather than against a stamp. `scripts/build/extract.py --force` is the
# way to write it out again.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
    echo "Usage: ./build.sh [ps2|linux-x64|macos]"
    echo "Defaults to ps2. Set CLEAN=1 to rebuild, JOBS=N to limit parallelism."
    echo "REGION=NTSC|PAL selects the PS2 release (default: NTSC)."
}

if [ "$#" -gt 1 ]; then
    usage >&2
    exit 2
fi

case "${1-ps2}" in
    ps2) ;;
    linux-x64) ;;
    macos)
        # Mach-O cannot be built in the Linux container, so this one stays on
        # the host.
        if [ "$(uname -s)" != Darwin ]; then
            echo "The macos build requires a Darwin host." >&2
            exit 1
        fi
        exec scripts/build/port.sh macos-arm64 port/build/macos-arm64
        ;;
    -h|--help) usage; exit 0 ;;
    *)
        echo "Unknown platform: $1" >&2
        usage >&2
        exit 2
        ;;
esac

. scripts/host/container.sh

# The build itself, the same inside a container as through the one started
# below.
if [ "${1-ps2}" = linux-x64 ]; then
    BUILD='exec scripts/build/port.sh linux-x64 port/build/pc'
else
    # CLEAN discards the region's build directory -- and nothing else under
    # ps2/build/ -- under the lock every build of the tree takes (see
    # scripts/build/cmake.sh), so it cannot pull the directory out from under
    # a build objdiff started. The region's objdiff report supplies the
    # coloured progress summary after the link.
    require_rom
    BUILD='
    set -e
    export REGION="${REGION:-NTSC}"
    dir=ps2/build/$(printf %s "$REGION" | tr "[:upper:]" "[:lower:]")
    if [ "${CLEAN:-0}" = 1 ]; then
        echo "CLEAN=1: discarding $dir; everything in it is built again."
        flock .build.lock rm -rf "$dir"
    fi
    scripts/build/cmake.sh elf ctx objdiff
    python3 scripts/build/progress_report.py --region "$REGION"
'
fi

if in_container; then
    exec sh -c "$BUILD"
fi

# The image holds only the toolchain, so it is built once and reused; the tree
# is mounted rather than copied in, which is what keeps the extracted disc
# (rom/), the split (ps2/asm/) and every object (ps2/build/) between runs. Set
# REBUILD_IMAGE=1 after editing the Dockerfile.
require_builder
ensure_image dcdecomp_dev dev
report_parallelism

# bash 3.2, which is what macOS ships, treats an empty array as unset under
# `set -u`, hence the guarded expansions below.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

# CLEAN, REGION and JOBS are for the build inside the container.
ENV_ARGS=(-e "CLEAN=${CLEAN:-0}" -e "REGION=${REGION:-NTSC}")
if [ -n "${JOBS:-}" ]; then ENV_ARGS+=(-e "JOBS=$JOBS"); fi

"$BUILDER" run --rm ${TTY[@]+"${TTY[@]}"} "${ENV_ARGS[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev sh -c "$BUILD"
