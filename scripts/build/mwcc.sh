#!/bin/sh
# Compile one source with MWCC and leave a depfile Ninja can read.
#
#   mwcc.sh <object> <depfile> <compiler> [args...]
#
# MWCC's -MMD writes the right shape of map, but to `<stem>.d` in the working
# directory and with wibo's Windows paths and CRLFs. So it is rewritten into
# <depfile>: forward slashes, `Z:` dropped, CR stripped, paths made absolute,
# and the target replaced with the object Ninja knows the edge by -- Ninja
# rejects any other target, and resolves relative paths against build/, which
# left every object permanently dirty. Source basenames are unique, so parallel
# compiles cannot collide over `<stem>.d`.
set -e

obj=$1
dep=$2
shift 2

"$@"

# The name MWCC chose: the source's basename with every extension removed, in
# the working directory. `build/src/savedata.cpp.o` -> `savedata.d`.
base=$(basename "$obj")
raw="${base%%.*}.d"

if [ ! -f "$raw" ]; then
    # Nothing to translate. Not fatal: the object is built, and the only cost
    # is include tracking for this one source.
    exit 0
fi

awk -v target="$obj" -v root="$(pwd)" '
    { gsub(/\r/, ""); gsub(/\\$/, ""); line = line " " $0 }
    END {
        sub(/^[^:]*:/, "", line)          # drop MWCCs own idea of the target
        gsub(/\\/, "/", line)             # Windows separators
        n = split(line, deps, /[ \t]+/)
        printf "%s/%s:", root, target
        for (i = 1; i <= n; i++) {
            path = deps[i]
            sub(/^[A-Za-z]:\//, "/", path)   # wibo drive letter
            if (path == "")
                continue
            if (path !~ /^\//)
                path = root "/" path
            printf " \\\n\t%s", path
        }
        printf "\n"
    }
' "$raw" > "$dep"

rm -f "$raw"
