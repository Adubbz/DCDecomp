#!/bin/sh
# Report how the built files compare against the retail originals, without
# failing the build
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

BUILD_DIR=${BUILD_DIR:-build}

python3 scripts/build/verify.py -f \
      "$BUILD_DIR/SCUS_971.11" "$BUILD_DIR/TITLE.BIN" "$BUILD_DIR/DUN.BIN" \
    || echo "Verification found unmatched or unverified build output (informational only)." >&2
