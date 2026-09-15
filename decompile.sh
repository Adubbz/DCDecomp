#!/usr/bin/env bash
# Decompile a function from the reference disassembly with m2c.
#
#   decompile.sh <symbol>                       wherever the symbol lives
#   decompile.sh {main|title|dun} <symbol>      ...if you want to say so
#   decompile.sh <symbol> --stack-structs       extra flags go to m2c
#   decompile.sh <symbol> --raw                 skip the prepared dump
#
# The dump is prepared first (scripts/diff/m2c_prep.py: jump tables named the
# way m2c recognises them, $gp displacements resolved to their symbols) and the
# output folded back into source spelling (scripts/diff/m2c_calls.py), so a
# method reads as GamePad.Down(0x40) rather than by its mangled name.
#
# Symbols are the mangled names diff.sh takes; look one up with
# `grep <name> config/*.symbols.txt`.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

usage() {
    echo "Usage: $0 [main|title|dun] symbol [m2c flags...]" >&2
    exit 1
}

section=()
if [[ $# -ge 2 && "$1" =~ ^(main|title|dun)$ && "$2" != -* ]]; then
    section=("$1")
    shift
fi
[[ $# -ge 1 ]] || usage
symbol=$1
shift

raw=0
remaining=()
for argument in "$@"; do
    if [ "$argument" = --raw ]; then raw=1; else remaining+=("$argument"); fi
done
set -- ${remaining[@]+"${remaining[@]}"}

CTX=build/ctx.c
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
            echo "$0: grep $symbol config/*.symbols.txt" >&2
        fi
        exit 1
    }
    read -r image asm _ _ _ <<<"$located"

    if [ "$raw" = 0 ]; then
        asm=$(python3 scripts/diff/m2c_prep.py "$asm" --image "$image")
    fi

    if [ ! -f "$CTX" ]; then
        echo "$0: $CTX is missing; generating it." >&2
        python3 scripts/diff/m2ctx.py -o "$CTX" >&2
    fi

    if [ "$raw" = 0 ]; then
        "${M2C[@]}" --context "$CTX" -f "$symbol" "$asm" "$@" \
            | python3 scripts/diff/m2c_calls.py
        exit "${PIPESTATUS[0]}"
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
    dcdecomp_dev "$CONTAINER_WORKDIR/decompile.sh" "${section[@]}" "$symbol" \
    ${raw:+$([ "$raw" = 1 ] && echo --raw)} "$@"
