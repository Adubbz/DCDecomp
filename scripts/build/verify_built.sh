#!/bin/sh
# Report how the built images compare against retail, function by function.
#
# A function is a perfect match when its compiled code is retail's bytes, a
# fuzzy match when it is the same instructions in the same order and differs
# only in the registers the compiler picked -- which its source has to declare
# with FUZZY_MATCH -- asm when an INCLUDE_ASM marker supplies retail's bytes
# because it is not decompiled, and unmatched otherwise. Data never differs.

set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

python3 scripts/build/verify.py -c \
    || echo "Verification found unmatched build output (informational only)." >&2
