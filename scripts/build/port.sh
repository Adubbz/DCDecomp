#!/bin/sh
# Configure and build the native port through one of CMakePresets.json's
# presets. build.sh comes through here, inside the dev container for Linux and
# on the host for macOS.
#
#   scripts/build/port.sh <preset> <build dir>
#   CLEAN=1 scripts/build/port.sh linux-x64 port/build/pc
#   JOBS=8 scripts/build/port.sh linux-x64 port/build/pc
#
# CMakeCache.txt records the absolute source directory it was generated for,
# and the tree is seen at different paths by the container and the host, so a
# cache from one makes cmake refuse to run under the other. `--fresh` discards
# such a cache; it is used only when the recorded source directory differs, or
# when configure fails for any other reason.
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

preset=${1:?usage: port.sh <preset> <build dir>}
dir=${2:?usage: port.sh <preset> <build dir>}

if [ "${CLEAN:-0}" = 1 ]; then
    echo "CLEAN=1: discarding $dir; everything in it is built again."
    rm -rf "$dir"
fi

cache_is_stale() {
    cache=$dir/CMakeCache.txt
    [ -f "$cache" ] || return 1

    home=$(sed -n 's/^CMAKE_HOME_DIRECTORY:INTERNAL=//p' "$cache" | head -1)
    [ -n "$home" ] || return 1
    [ "$home" != "$(pwd)" ]
}

if cache_is_stale; then
    echo "port.sh: build cache was generated elsewhere; reconfiguring from scratch." >&2
    cmake --fresh --preset "$preset"
elif ! cmake --preset "$preset"; then
    echo "port.sh: configure failed; retrying from scratch." >&2
    cmake --fresh --preset "$preset"
fi

if [ -z "${JOBS:-}" ]; then
    JOBS=$(nproc 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1)
fi

exec cmake --build --preset "$preset" --parallel "$JOBS"
