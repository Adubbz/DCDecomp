#!/bin/sh
# Keep <build dir>/globbed.txt -- the files CMakeLists.txt globs for -- up to
# date, rewriting it only when a file has been added or removed.
#
#   scripts/build/globs.sh <build dir>
#
# CMakeLists.txt names globbed.txt in CMAKE_CONFIGURE_DEPENDS, so ninja
# regenerates the build files exactly when the set of sources changes. That is
# what CONFIGURE_DEPENDS globs would do, but those re-run on every
# `cmake --build` and print "Re-checking globbed directories..." each time.
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

dir=$1
mkdir -p "$dir"
out=$dir/globbed.txt
# tools/mwccgap compiles a temporary beside its source; that comes and goes
# during a build and must not trigger a reconfigure.
listing=$(
    {
        find src -type f \( -name '*.cpp' -o -name '*.c' \) ! -name 'tmp*'
        find include -maxdepth 1 -type f \( -name '*.hpp' -o -name '*.h' \)
        find include/std include/sce -maxdepth 1 -type f
    } | LC_ALL=C sort
)
if [ ! -f "$out" ] || [ "$(cat "$out")" != "$listing" ]; then
    printf '%s\n' "$listing" > "$out"
fi
