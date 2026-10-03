#!/usr/bin/env bash
# Builds Mesa's Vulkan drivers for macOS on Apple Silicon into a prefix: KosmicKrisp (Vulkan on Metal 4,
# needs macOS 26) and lavapipe (software, any macOS). Run on the Mac:
#
#   scripts/host/mesa-macos.sh [PREFIX]
#
# PREFIX defaults to ~/.local/mesa/<tag>. A prefix that already holds this tag's build is left alone, so
# reruns are cheap; --force rebuilds. Environment: MESA_TAG, MESA_REPO (any clone of Mesa that carries the
# tag), MESA_WORK (source, build tree and Python environment; default ~/.cache/dcdecomp-mesa),
# MESA_SKIP_BREW=1 (dependencies are already installed).
#
# docs/MACOS.md explains the choices; the options below follow Mesa's docs/drivers/kosmickrisp.rst.

set -euo pipefail

# KosmicKrisp first appears in mesa-26.0.0 (25.3 has no kosmickrisp in meson.options).
MESA_TAG=${MESA_TAG:-mesa-26.2.4}
MESA_REPO=${MESA_REPO:-https://gitlab.freedesktop.org/mesa/mesa.git}
MESA_WORK=${MESA_WORK:-${XDG_CACHE_HOME:-$HOME/.cache}/dcdecomp-mesa}

# meson comes from PyPI at a pinned version instead of Homebrew's moving one.
BREW_PACKAGES=(ninja cmake pkgconf python llvm libclc spirv-llvm-translator spirv-tools bison flex)
PYTHON_PACKAGES=(meson==1.12.1 mako==1.4.3 packaging==26.3 PyYAML==6.0.3)

force=0
prefix=""
for arg in "$@"; do
    case "$arg" in
    --force) force=1 ;;
    -h | --help)
        sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
        exit 0
        ;;
    -*)
        echo "mesa-macos.sh: unknown option $arg" >&2
        exit 2
        ;;
    *) prefix=$arg ;;
    esac
done
prefix=${prefix:-$HOME/.local/mesa/$MESA_TAG}

system=$(uname -s)
if [[ $system != Darwin ]]; then
    echo "mesa-macos.sh: this builds Mesa for macOS and runs on a Mac" >&2
    exit 1
fi

stamp=$prefix/.dcdecomp-mesa
find_icd() {
    find "$prefix/share/vulkan/icd.d" -name "$1" -print -quit 2>/dev/null || true
}

print_environment() {
    local kosmickrisp lavapipe
    kosmickrisp=$(find_icd 'kosmickrisp_mesa_icd*.json')
    lavapipe=$(find_icd 'lvp_icd*.json')
    if [[ -z $kosmickrisp || -z $lavapipe ]]; then
        echo "mesa-macos.sh: $prefix lacks an ICD manifest (KosmicKrisp: '${kosmickrisp}', lavapipe: '${lavapipe}')" >&2
        exit 1
    fi
    local built
    built=$(<"$stamp")
    echo "# Mesa $MESA_TAG ($built) in $prefix"
    echo "# KosmicKrisp (Metal):"
    echo "export VK_DRIVER_FILES=$kosmickrisp VK_ICD_FILENAMES=$kosmickrisp"
    echo "# lavapipe (software):"
    echo "export VK_DRIVER_FILES=$lavapipe VK_ICD_FILENAMES=$lavapipe"
}

if [[ $force -eq 0 && -f $stamp ]] && grep -q "^$MESA_TAG " "$stamp"; then
    print_environment
    exit 0
fi

if [[ ${MESA_SKIP_BREW:-0} != 1 ]]; then
    missing=()
    for package in "${BREW_PACKAGES[@]}"; do
        brew list --versions "$package" >/dev/null 2>&1 || missing+=("$package")
    done
    if [[ ${#missing[@]} -gt 0 ]]; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "${missing[@]}"
    fi
fi

# llvm, bison and flex are keg-only. Mesa finds LLVM through llvm-config; it compiles with Apple's clang,
# whose libc++ is the one Homebrew's LLVM libraries are built against.
for keg in flex bison llvm; do
    keg_prefix=$(brew --prefix "$keg")
    PATH="$keg_prefix/bin:$PATH"
done
export PATH
export CC=/usr/bin/clang CXX=/usr/bin/clang++ OBJC=/usr/bin/clang

mkdir -p "$MESA_WORK"
venv=$MESA_WORK/venv
if [[ ! -x $venv/bin/python3 ]]; then
    python3 -m venv "$venv"
fi
"$venv/bin/python3" -m pip install --quiet --disable-pip-version-check "${PYTHON_PACKAGES[@]}"
PATH="$venv/bin:$PATH"

source_dir=$MESA_WORK/$MESA_TAG
if [[ ! -d $source_dir/.git ]]; then
    rm -rf "$source_dir"
    git clone --quiet --depth 1 --branch "$MESA_TAG" "$MESA_REPO" "$source_dir"
fi
version=$(cat "$source_dir/VERSION")
if [[ mesa-$version != "$MESA_TAG" ]]; then
    echo "mesa-macos.sh: $source_dir holds Mesa $version, not $MESA_TAG" >&2
    exit 1
fi
commit=$(git -C "$source_dir" rev-parse HEAD)

build_dir=$MESA_WORK/build-$MESA_TAG
options=(
    --prefix="$prefix"
    --buildtype=release
    --prefer-static
    -Dplatforms=macos
    "-Dvulkan-drivers=kosmickrisp,swrast"
    -Dgallium-drivers=
    -Dopengl=false
    -Dgles1=disabled
    -Dgles2=disabled
    -Degl=disabled
    -Dglx=disabled
    -Dllvm=enabled
    -Dzstd=disabled
)
if [[ -f $build_dir/build.ninja ]]; then
    meson setup --reconfigure "${options[@]}" "$build_dir" "$source_dir"
else
    rm -rf "$build_dir"
    meson setup "${options[@]}" "$build_dir" "$source_dir"
fi
meson compile -C "$build_dir"
meson install -C "$build_dir" --quiet

echo "$MESA_TAG $commit" >"$stamp"
print_environment
