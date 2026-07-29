#!/bin/sh
# Prepare an object for MWLD, in a single objcopy pass.
#
# 1. Strips zero-sized .text/.data/.bss. GNU-lineage assemblers always emit
#    those section headers even when a source file never puts anything in
#    them, and MWLD errors on any zero-sized input section.
# 2. Applies any extra objcopy arguments given after the object, which is how
#    an overlay's objects get their sections renamed onto the overlay's
#    private prefix (see cmake/Overlays.cmake).
#
# This runs once per object -- roughly four thousand times for a full build --
# so it stays at two processes: one readelf, one objcopy.

# The binutils-mips-ps2-decompals tools. Override MIPS_TOOL_PREFIX in the
# environment for a differently-named build of them.
: "${MIPS_TOOL_PREFIX:=mips-ps2-decompals-}"

obj="$1"
shift

remove=$("${MIPS_TOOL_PREFIX}readelf" -SW "$obj" | awk '
  { sub(/^ *\[[ 0-9]+\] +/, "") }
  ($1 == ".text" || $1 == ".data" || $1 == ".bss") && $5 ~ /^0+$/ {
      printf "--remove-section=%s ", $1
  }')

if [ -n "$remove" ] || [ "$#" -gt 0 ]; then
  "${MIPS_TOOL_PREFIX}objcopy" -I elf32-littlemips -O elf32-littlemips \
    $remove "$@" "$obj"
fi
