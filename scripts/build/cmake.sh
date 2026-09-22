#!/bin/sh
# The one place that runs cmake -- build.sh, run.sh, diff.sh and the
# Dockerfile's CMD all come through here, so the configure rules cannot drift.
#
#   scripts/build/cmake.sh <target>...       build these targets
#   BUILD_DIR=other scripts/build/cmake.sh elf
#   JOBS=8 scripts/build/cmake.sh elf        override ninja's own job count
#
# It brings the build files up to date, builds `setup`, then builds what was
# asked for.
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

# Configuring takes about as long as compiling a dozen objects, and every
# entry point starts with it. Ninja already knows when it is needed: build.ninja
# is a target of its own, rebuilt when CMakeLists.txt, anything a
# CMAKE_CONFIGURE_DEPENDS names, or a CONFIGURE_DEPENDS glob changes. So ask
# for that instead, and configure outright only when there is nothing to ask.
regenerate() {
    if [ ! -f "$BUILD_DIR/build.ninja" ] || cache_is_stale; then
        configure
        return
    fi
    # Held back and printed only when there was something to do, so the usual
    # case does not open with ninja reporting that it had nothing to.
    if regen=$(cmake --build "$BUILD_DIR" --target build.ninja 2>&1); then
        case $regen in
            ''|*"no work to do"*) : ;;
            *) printf '%s\n' "$regen" ;;
        esac
        return
    fi
    printf '%s\n' "$regen" >&2
    echo "cmake.sh: regenerating the build files failed; reconfiguring from scratch." >&2
    cmake --fresh -G Ninja -S . -B "$BUILD_DIR"
}

# Ninja picks its own job count from the CPUs it can see; JOBS is for saying
# otherwise, on a machine where that is the wrong number.
JOB_ARGS=""
if [ -n "${JOBS:-}" ]; then
    JOB_ARGS="--parallel $JOBS"
fi

build() {
    # shellcheck disable=SC2086 -- JOB_ARGS is a flag pair or nothing at all.
    cmake --build "$BUILD_DIR" $JOB_ARGS --target "$@"
}

regenerate

had_asm=1
[ -d asm/nonmatchings ] || had_asm=0

if [ -f "rom/Dark Cloud (USA).iso" ]; then
    build setup
elif [ "$had_asm" = 0 ]; then
    echo "cmake.sh: no rom/Dark Cloud (USA).iso and no asm/ to fall back on." >&2
    echo "          Place the NTSC 1.02 disc image in rom/ and try again." >&2
    exit 1
else
    echo "cmake.sh: no disc image; building against the committed asm/." >&2
fi

if [ "$had_asm" = 0 ]; then
    cmake -G Ninja -S . -B "$BUILD_DIR"
fi

[ $# -gt 0 ] || set -- build

build "$@"
