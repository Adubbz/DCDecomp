#!/usr/bin/env bash
# Build everything in the container and leave the results in build/.
set -euo pipefail

# Figure out where this script lives, then go up one directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

# Podman is what the project targets; the image is plain OCI, so Docker works.
if command -v podman &>/dev/null; then
  BUILDER=podman
elif command -v docker &>/dev/null; then
  BUILDER=docker
else
  echo "Podman or Docker not found! Please install one from:"
  echo "  https://podman.io/docs/installation"
  echo "  https://docs.docker.com/desktop/install"
  exit 1
fi

if [ ! -f "rom/Dark Cloud (USA).iso" ]; then
  echo "rom/Dark Cloud (USA).iso is missing; place the NTSC 1.02 ISO there first."
  exit 1
fi

# Build the image
"$BUILDER" build -t dcdecomp_build --target build .

mkdir -p build

# rom/ is mounted rather than copied in, so the 1.7GB ISO stays out of the
# build context; build/ receives the executable, the overlays and the ISO.
"$BUILDER" run --rm \
  -v "$(pwd)/rom:/dcdecomp/rom:Z" \
  -v "$(pwd)/build:/output:Z" \
  dcdecomp_build
