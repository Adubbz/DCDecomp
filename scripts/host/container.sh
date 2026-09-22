# Shared container plumbing, sourced from the project root; not run on its own.
# Podman is what the project targets, but the image is plain OCI so Docker works
# (under rootful Docker, build/ ends up owned by root). `in_container` is how
# the entry points notice they are already inside one and skip starting another.

# Where the tree is mounted, for every script that starts a container. Fixed,
# and the same path the build image and devcontainer use: they share build/, and
# CMakeCache.txt records the source directory it was configured for.
CONTAINER_WORKDIR=/dcdecomp

# Both runtimes leave a marker file, and podman also exports $container. The
# devcontainer CLI starts the same image, so it is covered by the same markers.
if [ -f /run/.containerenv ] || [ -f /.dockerenv ] || [ -n "${container:-}" ]; then
    IN_CONTAINER=1
else
    IN_CONTAINER=0
fi

in_container() {
    [ "$IN_CONTAINER" = 1 ]
}

# Only wanted on the host. Sourcing this file inside the container must not
# fail: the scripts that can do their own work there never call it.
require_builder() {
    if [ -n "${BUILDER:-}" ]; then
        return
    fi
    if in_container; then
        echo "$(basename "$0") starts a container, so it cannot run inside one." >&2
        echo "Run it on the host instead." >&2
        exit 1
    fi
    echo "Podman or Docker not found! Please install one from:" >&2
    echo "  https://podman.io/docs/installation" >&2
    echo "  https://docs.docker.com/desktop/install" >&2
    exit 1
}

# Preset BUILDER wins, so a machine with both installed can be pointed at the
# one it should use: BUILDER=docker ./build.sh
if [ -z "${BUILDER:-}" ]; then
    if command -v podman >/dev/null 2>&1; then
        BUILDER=podman
    elif command -v docker >/dev/null 2>&1; then
        BUILDER=docker
    else
        BUILDER=
    fi
fi

# Build the image only if it is missing. Set REBUILD_IMAGE=1 to force one,
# which is what you want after editing the Dockerfile.
ensure_image() {
    image=$1
    target=$2

    if in_container; then
        return
    fi
    require_builder

    if [ "${REBUILD_IMAGE:-0}" != 1 ] \
       && "$BUILDER" image inspect "$image" >/dev/null 2>&1; then
        return
    fi

    echo "Building the $target image ($image); this takes a few minutes once."
    "$BUILDER" build -t "$image" --target "$target" .
}

# How much of the machine the build gets. On macOS and Windows podman runs the
# build in a virtual machine with a CPU count of its own, and the default is
# well under the host's -- which caps every parallel step in the build without
# saying so. Reported once per run rather than left to look like the build's
# own speed. Nothing here fails: a podman without a machine, or docker, simply
# has nothing to report.
report_parallelism() {
    if in_container || [ "${BUILDER:-}" != podman ]; then
        return
    fi

    vm_cpus=$(podman machine inspect --format '{{.Resources.CPUs}}' 2>/dev/null \
              | head -1)
    case $vm_cpus in
        ''|*[!0-9]*) return ;;
    esac

    host_cpus=$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 0)
    case $host_cpus in
        ''|*[!0-9]*) return ;;
    esac

    [ "$host_cpus" -gt "$vm_cpus" ] || return 0

    # Half the host's memory, so the suggestion is not one that fails to
    # start on a small machine. Left out entirely if it cannot be read.
    host_mb=$(sysctl -n hw.memsize 2>/dev/null)
    if [ -n "$host_mb" ]; then
        host_mb=$((host_mb / 1024 / 1024))
    else
        host_mb=$(awk '/^MemTotal:/ {print int($2 / 1024)}' /proc/meminfo 2>/dev/null)
    fi
    memory=""
    case $host_mb in
        ''|*[!0-9]*) ;;
        *) [ "$host_mb" -ge 4096 ] && memory=" --memory $((host_mb / 2))" ;;
    esac

    echo "The podman machine has $vm_cpus of this host's $host_cpus CPUs; the build is"
    echo "only as parallel as that. To give it the rest:"
    echo "  podman machine stop"
    echo "  podman machine set --cpus $host_cpus$memory"
    echo "  podman machine start"
}

require_rom() {
    if [ ! -f "rom/Dark Cloud (USA).iso" ]; then
        echo "rom/Dark Cloud (USA).iso is missing." >&2
        echo "Place the NTSC 1.02 disc image there and try again." >&2
        exit 1
    fi
}
