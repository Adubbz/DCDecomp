#!/usr/bin/env bash
set -euo pipefail
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. scripts/host/container.sh
if in_container; then exec "$@"; fi
require_builder
ensure_image dcdecomp_dev dev
exec "$BUILDER" run --rm -v "$PWD:$CONTAINER_WORKDIR:Z" -w "$CONTAINER_WORKDIR" -e HOME=/tmp dcdecomp_dev "$@"
