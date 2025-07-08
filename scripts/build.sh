#!/usr/bin/env bash
set -euo pipefail

# Figure out where this script lives, then go up one directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

# Check for Docker (or Podman)
if ! command -v docker &>/dev/null && ! command -v podman &>/dev/null; then
  echo "Docker or Podman not found! Please install one from:"
  echo "  https://docs.docker.com/desktop/install"
  exit 1
fi

# Build with Podman if available, otherwise Docker
if command -v podman &>/dev/null; then
  BUILDER=podman
else
  BUILDER=docker
fi

# Build the image
"$BUILDER" build -t dcdecomp_build --target build .

# Run the container, mounting the local build/ directory into /output
"$BUILDER" run --rm \
  -v "$(pwd)/build:/output:Z" \
  dcdecomp_build
