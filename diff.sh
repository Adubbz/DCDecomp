#!/usr/bin/env bash
# Diff a function against the retail original.
#
#   diff.sh <symbol>                    the main executable
#   diff.sh {main|title|dun} <symbol>
#
# The main executable is diffed as two ELFs, so asm-differ resolves symbol
# names itself. The overlays ship as raw images with no symbol table, so their
# functions are located in the link map here and diffed by address; see
# diff_settings.py for how the images are picked.
set -euo pipefail

usage() {
    echo "Usage: $0 {main|title|dun} symbol"
    exit 1
}

# Use the project root as the working directory
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

DIFF=(python tools/asm-differ/diff.py -s -w -m -d)

if [[ "$mode" == "main" ]]; then
    exec "${DIFF[@]}" -o -os "$symbol" -f build/SCUS_971.11 -j main "$symbol"
fi

MAP=build/SCUS_971.11.xMAP
if [[ ! -f "$MAP" ]]; then
    echo "$MAP is missing; build the elf target first." >&2
    exit 1
fi

# Find the symbol in the overlay's part of the link map and turn its address
# range into offsets into the overlay image. A function runs until the next
# symbol contributed by a different object.
read -r start end < <(python3 - "$MAP" ".$mode" "$symbol" <<'PY'
import re, sys

map_path, block, symbol = sys.argv[1:4]
# Byte 0 of an overlay image is its MWo3 header, which loads at this address.
ORIGIN = 0x01DABD00
ROW = re.compile(r'  ([0-9A-Fa-f]{8}) [0-9A-Fa-f]{8} \S+\s+(\S+)\t\((\S+)\)$')

rows, section = [], None
for line in open(map_path, encoding='utf-8', errors='replace'):
    line = line.rstrip('\r\n')
    if line.startswith('# '):
        section = line[2:].strip()
        continue
    match = ROW.match(line)
    if section == block and match:
        rows.append((int(match.group(1), 16), match.group(2), match.group(3)))

rows.sort(key=lambda row: row[0])
hits = [row for row in rows if row[1] == symbol]
if not hits:
    sys.exit(f'{symbol} is not in the {block} section of {map_path}')

start, _, obj = hits[0]
end = next((addr for addr, _, owner in rows if addr > start and owner != obj), None)
print(hex(start - ORIGIN), hex(end - ORIGIN) if end else '')
PY
)

export DCDECOMP_OVERLAY="$mode"
exec "${DIFF[@]}" "$start" ${end:+"$end"}
