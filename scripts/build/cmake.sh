#!/bin/sh
# The one place that runs cmake -- build.sh, run.sh, diff.sh and the
# Dockerfile's CMD all come through here, so the configure rules cannot drift.
#
#   scripts/build/cmake.sh <target>...       build these targets
#   BUILD_DIR=other scripts/build/cmake.sh elf
#
# It configures, builds `setup`, then builds what was asked for.
#
# CMakeCache.txt records the absolute source directory it was generated for,
# and build/ is shared between contexts that see the tree at different paths
# (the build image, the devcontainer, a host bind mount), so a cache from one
# makes cmake refuse to run under another -- `cmake --build` included, since it
# re-runs configure through build.ninja. That is why nothing else calls cmake.
# `--fresh` fixes it but discards a good cache, so it is used only when the
# recorded source directory differs, or when configure fails for any reason.
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

BUILD_DIR=${BUILD_DIR:-build}

# Whether the existing cache was generated for this source directory. A cache
# that is absent or unreadable is not stale -- there is simply nothing to
# reuse, and cmake will write one.
cache_is_stale() {
    cache=$BUILD_DIR/CMakeCache.txt
    [ -f "$cache" ] || return 1

    home=$(sed -n 's/^CMAKE_HOME_DIRECTORY:INTERNAL=//p' "$cache" | head -1)
    [ -n "$home" ] || return 1
    [ "$home" != "$(pwd)" ]
}

configure() {
    if cache_is_stale; then
        echo "cmake.sh: build cache was generated elsewhere; reconfiguring from scratch." >&2
        cmake --fresh -G Ninja -S . -B "$BUILD_DIR"
        return
    fi

    # The retry covers what the path check cannot: a cache left by a different
    # generator or an incompatible cmake, and anything else that only shows up
    # when configure actually runs.
    cmake -G Ninja -S . -B "$BUILD_DIR" && return
    echo "cmake.sh: configure failed; retrying from scratch." >&2
    cmake --fresh -G Ninja -S . -B "$BUILD_DIR"
}

configure

had_ref=1
[ -d ref ] || had_ref=0

if [ -f "rom/Dark Cloud (USA).iso" ]; then
    cmake --build "$BUILD_DIR" --target setup
elif [ "$had_ref" = 0 ]; then
    echo "cmake.sh: no rom/Dark Cloud (USA).iso and no ref/ to fall back on." >&2
    echo "          Place the NTSC 1.02 disc image in rom/ and try again." >&2
    exit 1
else
    echo "cmake.sh: no disc image; building against the committed ref/." >&2
fi

if [ "$had_ref" = 0 ]; then
    cmake -G Ninja -S . -B "$BUILD_DIR"
fi

[ $# -gt 0 ] || set -- build

exec cmake --build "$BUILD_DIR" --target "$@"
