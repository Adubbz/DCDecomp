#!/usr/bin/env bash
# Decompile a function from the reference disassembly with m2c.
#
#   decompile.sh <symbol>                       wherever the symbol lives
#   decompile.sh {main|title|dun} <symbol>      ...if you want to say so
#   decompile.sh <symbol> --stack-structs       extra flags go to m2c
#
# Symbols are the mangled names diff.sh takes; look one up with
# `grep <name> ref/asm/objects/*.index`. Output goes to stdout. m2c reports
# failures as a C comment rather than on stderr, so a failed run still exits 0.
# The work happens in the container, like the other entry points.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

usage() {
    echo "Usage: $0 [main|title|dun] symbol [m2c flags...]" >&2
    exit 1
}

# The section is optional -- the reference index knows which one a symbol is
# in. `main` is both a section name and a real symbol, so it only counts as the
# former when something that is not a flag follows it.
section=()
if [[ $# -ge 2 && "$1" =~ ^(main|title|dun)$ && "$2" != -* ]]; then
    section=("$1")
    shift
fi
[[ $# -ge 1 ]] || usage
symbol=$1
shift

CTX=build/ctx.c

# mipsee is the Emotion Engine's MIPS variant, mwcc the compiler this project
# builds with, and c++ what gets the CodeWarrior symbol names demangled -- m2c
# prints `CSaveData::SetDay (int)` above the function because of that last
# part. The default is mips-ido-c, which is wrong on all three counts here.
M2C=(python3 tools/m2c/m2c.py --target mipsee-mwcc-c++)

run() {
    if [ ! -f tools/m2c/m2c.py ]; then
        echo "$0: tools/m2c is empty. Run: git submodule update --init" >&2
        exit 1
    fi

    located=$(python3 scripts/diff/ref_index.py "$symbol" "${section[@]}" 2>/dev/null) || {
        if [[ ${#section[@]} -ne 0 ]]; then
            echo "$0: $symbol is not in the ${section[0]} reference index" >&2
        else
            echo "$0: $symbol is in no reference index -- check the spelling with" >&2
            echo "$0: grep $symbol ref/asm/objects/*.index" >&2
        fi
        exit 1
    }
    read -r _ asm _ _ _ <<<"$located"

    # The context is a build artefact; generate it if this tree has not built
    # yet, so the script works from a fresh checkout after `setup`.
    if [ ! -f "$CTX" ]; then
        echo "$0: $CTX is missing; generating it." >&2
        python3 scripts/diff/m2ctx.py -o "$CTX" >&2
    fi

    exec "${M2C[@]}" --context "$CTX" -f "$symbol" "$asm" "$@"
}

if in_container; then
    run "$@"
fi

require_builder
ensure_image dcdecomp_dev dev

exec "$BUILDER" run --rm \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev "$CONTAINER_WORKDIR/decompile.sh" "${section[@]}" "$symbol" "$@"
