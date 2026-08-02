#!/usr/bin/env bash
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
. scripts/host/container.sh

require_rom
ensure_image dcdecomp_dev dev

if in_container; then
    exec scripts/build/cmake.sh objdiff
fi

require_builder

TTY=()
if [ -t 1 ]; then TTY=(-t); fi

"$BUILDER" run --rm "${TTY[@]}" \
    -v "$PWD:$CONTAINER_WORKDIR:Z" \
    -w "$CONTAINER_WORKDIR" \
    -e HOME=/tmp \
    dcdecomp_build sh -c '
            scripts/build/cmake.sh objdiff
  '
