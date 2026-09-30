#!/bin/sh
# The one place that runs cmake -- build.sh, run.sh, diff.sh and the
# Dockerfile's CMD all come through here, so the configure rules cannot drift.
#
#   scripts/build/cmake.sh <target>...       build these targets
#   REGION=PAL scripts/build/cmake.sh elf    build the PAL prototype (default NTSC)
#   BUILD_DIR=other scripts/build/cmake.sh elf
#   JOBS=8 scripts/build/cmake.sh elf        run 8 jobs rather than one per CPU
#
# Each release builds in a directory of its own, build/ntsc or build/pal.
#
# It brings the build files up to date, builds `setup`, then builds what was
# asked for.
#
# CMakeCache.txt records the absolute source directory it was generated for,
# and the build tree is shared between contexts that see the tree at different paths
# (the build image, the devcontainer, a host bind mount), so a cache from one
# makes cmake refuse to run under another -- `cmake --build` included, since it
# re-runs configure through build.ninja. That is why nothing else calls cmake.
# `--fresh` fixes it but discards a good cache, so it is used only when the
# recorded source directory differs, or when configure fails for any reason.
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

# One build of the tree at a time. The split rewrites thousands of files under
# asm/ over several seconds, and objdiff's GUI watches asm/ and starts a build
# of its own (scripts/build/build_objdiff.sh) the moment they change; a unit
# compiled against a half-written split links into an image that is wrong
# throughout. Everything that builds takes this lock, so such a build waits
# for the split to finish instead. It lives outside build/ so that CLEAN
# cannot delete it from under a build holding it. The two releases share it:
# they compile the same sources, and tools/mwccgap writes its temporaries
# beside them.
BUILD_LOCK=.build.lock
if [ -z "${DCDECOMP_BUILD_LOCKED:-}" ]; then
    export DCDECOMP_BUILD_LOCKED=1
    if ! flock -n "$BUILD_LOCK" true; then
        echo "cmake.sh: another build of this tree is running (objdiff's, perhaps); waiting for it." >&2
    fi
    exec flock "$BUILD_LOCK" "$(pwd)/scripts/build/cmake.sh" "$@"
fi

REGION=${REGION:-NTSC}
export DCDECOMP_REGION=$REGION
BUILD_DIR=${BUILD_DIR:-build/$(printf %s "$REGION" | tr '[:upper:]' '[:lower:]')}

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
        cmake --fresh -G Ninja -S . -B "$BUILD_DIR" -DREGION="$REGION"
        return
    fi

    # The retry covers what the path check cannot: a cache left by a different
    # generator or an incompatible cmake, and anything else that only shows up
    # when configure actually runs.
    cmake -G Ninja -S . -B "$BUILD_DIR" -DREGION="$REGION" && return
    echo "cmake.sh: configure failed; retrying from scratch." >&2
    cmake --fresh -G Ninja -S . -B "$BUILD_DIR" -DREGION="$REGION"
}

# Configuring takes about as long as compiling a dozen objects, and every
# entry point starts with it. Ninja already knows when it is needed: build.ninja
# is a target of its own, rebuilt when CMakeLists.txt, anything a
# CMAKE_CONFIGURE_DEPENDS names -- scripts/build/globs.sh's listing of the
# globbed sources among them -- changes. So ask
# for that instead, and configure outright only when there is nothing to ask.
regenerate() {
    scripts/build/globs.sh "$BUILD_DIR"
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
    cmake --fresh -G Ninja -S . -B "$BUILD_DIR" -DREGION="$REGION"
}

# Every CPU this process may run on, unless JOBS says otherwise. Exported so
# the split (scripts/build/disassemble.py) spreads over the same count.
if [ -z "${JOBS:-}" ]; then
    JOBS=$(nproc 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1)
fi
export JOBS
JOB_ARGS="--parallel $JOBS"

build() {
    # shellcheck disable=SC2086 -- JOB_ARGS is a flag pair or nothing at all.
    cmake --build "$BUILD_DIR" $JOB_ARGS --target "$@"
}

# Build targets only when a dry run finds something to do, so an up-to-date
# prerequisite does not print ninja's "no work to do" ahead of the real build.
build_if_stale() {
    case $(cmake --build "$BUILD_DIR" --target "$@" -- -n 2>&1) in
        *"no work to do"*) : ;;
        *) build "$@" ;;
    esac
}

regenerate

had_asm=1
[ -d "asm/$(printf %s "$REGION" | tr '[:upper:]' '[:lower:]')/nonmatchings" ] || had_asm=0

# asm/<region> is split rather than committed, from the binaries under
# rom/<region>/extracted: the disc's once it has been extracted, or the private
# repository's copies.
build_if_stale setup

if [ "$had_asm" = 0 ]; then
    cmake -G Ninja -S . -B "$BUILD_DIR" -DREGION="$REGION"
fi

[ $# -gt 0 ] || set -- build

build "$@"
