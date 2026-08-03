#!/usr/bin/env bash
# Build everything and leave the results in build/. Use run.sh instead if you
# want an incremental build that also boots the result.
#
# On the host this builds a container image from a clean copy of the tree and
# runs it; inside a container it drives the same targets against the tree.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh

require_rom

if in_container; then
    # The image's own build stage runs exactly these targets, through the same
    # script; the difference is that it gets a pristine copy of the sources,
    # while this builds the tree as it stands.
    echo "Already inside the container: building the working tree in place."
    exec scripts/build/cmake.sh elf ctx
fi

require_builder

# Always rebuilt: this stage copies the tree into the image, so a stale image
# would build stale sources.
"$BUILDER" build -t dcdecomp_build --target build .

mkdir -p build ref

# rom/ and ref/ are mounted rather than copied in: rom/ keeps the 1.7GB disc
# out of the build context, and ref/ makes the extraction and disassembly
# survive between runs. The image still gets a clean copy of the sources, which
# is the point of this script. -t keeps the colours and progress line, skipped
# when this script's own output is redirected.
TTY=()
if [ -t 1 ]; then TTY=(-t); fi

"$BUILDER" run --rm "${TTY[@]}" \
  -v "$(pwd)/rom:/dcdecomp/rom:Z" \
  -v "$(pwd)/ref:/dcdecomp/ref:Z" \
  -v "$(pwd)/build:/output:Z" \
  dcdecomp_build
