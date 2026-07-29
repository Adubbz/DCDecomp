#!/usr/bin/env bash
# Diff a function against the retail original.
#
#   diff.sh <symbol>                       wherever the symbol lives
#   diff.sh {main|title|dun} <symbol>      ...if you want to say so explicitly
#   diff.sh <symbol> -o - --format json    extra flags go to objdiff-cli
#   diff.sh --scratch <symbol>             create a decomp.me scratch instead
#   diff.sh --report                       whole-project progress report
#
# --scratch uploads the function's disassembly and build/ctx.cpp to decomp.me,
# a public site, with this project's compiler and flags, and prints the URL.
# --report writes progress/report.json for decomp.dev; CI regenerates it, so
# this is for looking at the number locally.
#
# Symbols are the mangled names the compiler uses, e.g. SetDay__9CSaveDataFi;
# look one up with `grep <name> ref/asm/objects/*.index`. The work happens in
# the container, where objdiff and the EE binutils live.
#
# objdiff compares object files, not disassembly text: the target is the
# reference dump as retail wrote it, the base is whatever provides that
# function now, and objdiff.json pairs them -- so a unit is "<section>/<symbol>".
set -euo pipefail

# Use the project root as the working directory
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

usage() {
    echo "Usage: $0 [--scratch|--report] [main|title|dun] symbol [objdiff flags...]" >&2
    exit 1
}

mode=diff
case "${1:-}" in
    --scratch) mode=scratch; shift ;;
    --report)  mode=report;  shift ;;
esac

section=()
symbol=
if [[ $mode != report ]]; then
    # The section is optional: the reference index knows which one a symbol is
    # in. `main` is both a section name and a real symbol, so it only counts as
    # the former when something that is not a flag follows it.
    if [[ $# -ge 2 && "$1" =~ ^(main|title|dun)$ && "$2" != -* ]]; then
        section=("$1")
        shift
    fi
    [[ $# -ge 1 ]] || usage
    symbol=$1
    shift
fi

require_rom
ensure_image dcdecomp_dev dev

TTY=()

case $mode in
    scratch)
        [[ $# -eq 0 ]] || { echo "$0: --scratch takes no extra flags: $*" >&2; exit 1; }
        ARGS=(python3 scripts/diff/decompme.py "$symbol" "${section[@]}")
        ;;

    report)
        # objdiff.json and the target objects have to be current first;
        # scripts/build/cmake.sh owns the configuring.
        ARGS=(sh -c '
            scripts/build/cmake.sh objdiff
            mkdir -p progress
            objdiff-cli report generate -o progress/report.json "$@"
            echo "wrote progress/report.json" >&2
        ' report "$@")
        ;;

    diff)
        # objdiff addresses a function by its unit, so the section has to be
        # resolved even when it was not given -- the reference index is what
        # knows it, exactly as it does for --scratch.
        if located=$(python3 scripts/diff/ref_index.py "$symbol" "${section[@]}" 2>/dev/null); then
            read -r found _ <<<"$located"
        elif [[ ${#section[@]} -ne 0 ]]; then
            echo "$0: $symbol is not in the ${section[0]} reference index" >&2
            exit 1
        else
            echo "$0: $symbol is in no reference index -- check the spelling with" >&2
            echo "$0: grep $symbol ref/asm/objects/*.index" >&2
            exit 1
        fi

        ARGS=(sh -c '
            unit=$1; sym=$2; shift 2
            scripts/build/cmake.sh objdiff >/dev/null
            exec objdiff-cli diff -p . -u "$unit" "$sym" "$@"
        ' diff "$found/$symbol" "$symbol" "$@")

        # objdiff's interactive view needs a terminal, but `diff.sh ... | cat`
        # and CI runs must not be given one.
        [[ -t 0 && -t 1 ]] && TTY=(-it)
        ;;
esac

if in_container; then
    exec "${ARGS[@]}"
fi

require_builder

exec "$BUILDER" run --rm "${TTY[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_dev "${ARGS[@]}"
