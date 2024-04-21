#!/usr/bin/env bash

usage() {
    echo "Usage: $0 {main|title|dun} symbol"
    exit 1
}

# Use the project root as the working directory
cd "${0%/*}/../"

if [[ $# -eq 1 ]]; then
    mode="main"
    symbol=$1
elif [[ $# -eq 2 ]]; then
    mode=$1
    symbol=$2
else
    usage
fi

# Validate mode
case "$mode" in 
    main|title|dun)
        ;;
    *)
    usage
esac

if [[ "$mode" == "main" ]]; then
    python tools/asm-differ/diff.py -s -w -m -d -o -os "$symbol" -f build/SCUS_971.11 -j main "$symbol"
fi