#!/bin/sh
# Strips zero-sized .text/.data/.bss sections from an object file.
#
# GNU-lineage assemblers always emit .text/.data/.bss section headers,
# even when a source file never places anything in them. MWLD will error on
# any zero-sized input section it encounters so these empty sections must be
# removed before linking.

obj="$1"

flags=$(mips64r5900el-ps2-elf-readelf -SW "$obj" \
  | sed -E 's/^ *\[[ 0-9]+\] +//' \
  | awk '($1==".text"||$1==".data"||$1==".bss") && $5 ~ /^0+$/ { printf "--remove-section=%s ", $1 }')

if [ -n "$flags" ]; then
  mips64r5900el-ps2-elf-objcopy -I elf32-littlemips -O elf32-littlemips $flags "$obj"
fi
