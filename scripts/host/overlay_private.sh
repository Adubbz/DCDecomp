#!/bin/sh
# Copy the private repository's files into this tree.
#
#   scripts/host/overlay_private.sh [checkout]     default: .private
#
# The private repository mirrors this tree's layout and holds only files that
# are gitignored here: retail-derived data this repository must not carry.
#
#   rom/{ntsc,pal}/extracted/iso/{SCUS_971.11,TITLE.BIN,DUN.BIN}
#                          what splat splits asm/ from for each release, so
#                          no disc image is needed to build or report progress
#
# Every file it tracks, bar its README, is copied to the same path here, and
# the build finds them exactly where extracting the disc would have put them.
# A file the private repository still keeps under rom/extracted/, the layout
# from before the regions had directories of their own, is the NTSC disc's and
# lands under rom/ntsc/extracted/. Nothing else is touched.
set -eu

cd "$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

src=${1:-.private}

if ! git -C "$src" rev-parse --git-dir >/dev/null 2>&1; then
    echo "overlay_private.sh: $src is not a checkout of the private repository." >&2
    echo "  git clone <private repository> $src" >&2
    exit 1
fi

count=0
for path in $(git -C "$src" ls-files); do
    case $path in
        README.md|.gitignore) continue ;;
    esac
    dest=$path
    case $path in
        rom/extracted/*) dest=rom/ntsc/${path#rom/} ;;
    esac
    mkdir -p "$(dirname "$dest")"
    cp -p "$src/$path" "$dest"
    count=$((count + 1))
done

echo "overlay_private.sh: copied $count file(s) from $src" \
     "($(git -C "$src" rev-parse --short HEAD))"
