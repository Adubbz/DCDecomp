# Shared container plumbing. Sourced from the project root by the other
# scripts; not meant to be run on its own.
#
# Podman is what the project targets. The image is plain OCI, so Docker works
# too, but under rootful Docker the files the build writes into build/ end up
# owned by root.

if command -v podman >/dev/null 2>&1; then
    BUILDER=podman
elif command -v docker >/dev/null 2>&1; then
    BUILDER=docker
else
    echo "Podman or Docker not found! Please install one from:" >&2
    echo "  https://podman.io/docs/installation" >&2
    echo "  https://docs.docker.com/desktop/install" >&2
    exit 1
fi

# Build the image only if it is missing. Set REBUILD_IMAGE=1 to force one,
# which is what you want after editing the Dockerfile.
ensure_image() {
    image=$1
    target=$2

    if [ "${REBUILD_IMAGE:-0}" != 1 ] \
       && "$BUILDER" image inspect "$image" >/dev/null 2>&1; then
        return
    fi

    echo "Building the $target image ($image); this takes a few minutes once."
    "$BUILDER" build -t "$image" --target "$target" .
}

require_rom() {
    if [ ! -f "rom/Dark Cloud (USA).iso" ]; then
        echo "rom/Dark Cloud (USA).iso is missing." >&2
        echo "Place the NTSC 1.02 disc image there and try again." >&2
        exit 1
    fi
}
