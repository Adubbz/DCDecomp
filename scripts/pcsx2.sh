#!/usr/bin/env bash
# Boot an ISO in PCSX2.
#
# PCSX2 needs a display and a GPU, so this always runs on the host, never in
# the build container. Set PCSX2 to override the search below.
set -euo pipefail

iso=${1:?usage: pcsx2.sh <iso>}

if [ ! -f "$iso" ]; then
    echo "$iso does not exist; build the iso target first." >&2
    exit 1
fi

find_pcsx2() {
    if [ -n "${PCSX2:-}" ]; then
        echo "$PCSX2"
        return
    fi
    for candidate in pcsx2-qt pcsx2 PCSX2; do
        if command -v "$candidate" >/dev/null 2>&1; then
            echo "$candidate"
            return
        fi
    done
    if command -v flatpak >/dev/null 2>&1 \
       && flatpak info net.pcsx2.PCSX2 >/dev/null 2>&1; then
        echo "flatpak run net.pcsx2.PCSX2"
        return
    fi
    for appimage in "$HOME"/Applications/PCSX2*.AppImage "$HOME"/Downloads/PCSX2*.AppImage; do
        if [ -x "$appimage" ]; then
            echo "$appimage"
            return
        fi
    done
}

emulator=$(find_pcsx2)
if [ -z "$emulator" ]; then
    echo "PCSX2 not found. Install it, or point PCSX2 at the executable:" >&2
    echo "  PCSX2=/path/to/pcsx2-qt cmake --build build --target run" >&2
    exit 1
fi

# -- ends PCSX2's own options so the ISO path is taken literally, spaces and all.
echo "Booting $iso in $emulator"
exec $emulator -fastboot -- "$iso"
