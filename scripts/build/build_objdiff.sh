#!/usr/bin/env bash
# The rebuild objdiff's GUI runs on every save. Kept as short as it can be:
# this is in the edit-save-look loop, not a batch build.
#
# `cmake --build` rather than scripts/build/cmake.sh, which configures first --
# about half the wall time here, and redundant, because ninja re-runs cmake by
# itself when CMakeLists.txt or the generator inputs actually change. The long
# way round is only for a build directory that cannot be used as it stands:
# never configured, or configured somewhere else (see scripts/build/cmake.sh).
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
. scripts/host/container.sh

REBUILD='
    cache=build/CMakeCache.txt
    home=$(sed -n "s/^CMAKE_HOME_DIRECTORY:INTERNAL=//p" "$cache" 2>/dev/null | head -1)
    if [ -f build/build.ninja ] && [ "$home" = "$(pwd)" ]; then
        exec cmake --build build --target objdiff
    fi
    exec scripts/build/cmake.sh objdiff
'

if in_container; then
    exec sh -c "$REBUILD"
fi

require_builder
ensure_image dcdecomp_dev dev

exec "$BUILDER" run --rm \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev sh -c "$REBUILD"
