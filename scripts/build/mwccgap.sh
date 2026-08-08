#!/bin/sh
# Compile one source whose INCLUDE_ASM markers stand in for functions that are
# not decompiled yet, and leave a depfile Ninja can read.
#
#   mwccgap.sh <object> <depfile> <source> [mwcc args...]
#
# tools/mwccgap compiles the source twice: once as written, to learn which
# functions the C++ already defines, and once with each marker replaced by a
# run of `nop` the size of the function it stands for. It then assembles the
# reference dump and puts those bytes over the nops. The result is one object
# holding both, which is what lets a half-decompiled translation unit link at
# retail's addresses -- mwcc emits a unit's functions as one contiguous .text,
# so a hole in the middle cannot be filled from an outside .s.
#
# The second compile reads a temporary file, always named `.c`, so mwcc can no
# longer tell the language from the extension -- `-lang` is passed explicitly,
# picked from the real source's. The game's own code is C++; everything under
# src/lib/ is C, being the SDK, newlib and libgcc.
#
# Argument order matters. mwccgap takes the two positionals first and passes
# everything it does not recognise to mwcc, and `--as-flags` takes a list, so
# it has to come last or it swallows the compiler's flags.
set -e

obj=$1
dep=$2
src=$3
shift 3

case "$src" in
    *.c) lang=c ;;
    *)   lang=c++ ;;
esac

: "${MWCCGAP_DIR:=tools/mwccgap}"

# A submodule, and the only one the build itself needs; a clone without
# --recursive leaves the directory empty and the failure is otherwise a
# confusing "No such file or directory" from python.
if [ ! -f "$MWCCGAP_DIR/mwccgap.py" ]; then
    echo "$0: $MWCCGAP_DIR is empty -- run: git submodule update --init" >&2
    exit 1
fi

: "${MW_DIR:=tools/compilers/mw/2.3.3}"
: "${MIPS_TOOL_PREFIX:=mips-ps2-decompals-}"
: "${STD_INCLUDE_DIR:=include/std}"

MWCIncludes=$STD_INCLUDE_DIR \
PYTHONPATH=$MWCCGAP_DIR \
python3 "$MWCCGAP_DIR/mwccgap.py" "$src" "$obj" \
    --mwcc-path "$MW_DIR/mwccmips.exe" \
    --use-wibo \
    --as-path "${MIPS_TOOL_PREFIX}as" \
    --as-march r5900 \
    --as-mabi eabi \
    --asm-dir-prefix "${ASM_DIR:-ref/asm/split}" \
    -lang "$lang" \
    "$@" \
    --as-flags -g -mno-pdr -non_shared -G0 -Iinclude < /dev/null

# MWCC writes its dependency map to `<stem>.d` in the working directory. The
# first of mwccgap's two compiles reads the real source, so that pass leaves
# the map under the name this build expects; the second reads a temporary file
# and leaves one under that name, which is swept up below. See the awk below for what
# the rewrite has to fix.
base=$(basename "$obj")
raw="${base%%.*}.d"

if [ -f "$raw" ]; then
    awk -v target="$obj" -v root="$(pwd)" '
        { gsub(/\r/, ""); gsub(/\\$/, ""); line = line " " $0 }
        END {
            sub(/^[^:]*:/, "", line)
            gsub(/\\/, "/", line)
            n = split(line, deps, /[ \t]+/)
            printf "%s/%s:", root, target
            for (i = 1; i <= n; i++) {
                path = deps[i]
                sub(/^[A-Za-z]:\//, "/", path)
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
fi

# The temporary source mwccgap compiles is named tmp*.c, and its map is left
# beside the others.
rm -f tmp*.d
