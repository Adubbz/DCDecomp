#!/usr/bin/env bash
# Build everything in the container from a clean copy of the tree and leave the
# results in build/. Use scripts/run.sh instead if you want an incremental
# build that also boots the result.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. scripts/container.sh

require_rom

# Always rebuilt: this stage copies the tree into the image, so a stale image
# would build stale sources.
"$BUILDER" build -t dcdecomp_build --target build .

mkdir -p build

# rom/ is mounted rather than copied in, so the 1.7GB disc image stays out of
# the build context; build/ receives the executable, the overlays and the ISO.
"$BUILDER" run --rm \
  -v "$(pwd)/rom:/dcdecomp/rom:Z" \
  -v "$(pwd)/build:/output:Z" \
  dcdecomp_build
