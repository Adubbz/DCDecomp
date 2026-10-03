# macOS on Apple Silicon

The PC port (`docs/PC.md`) builds for arm64 macOS with Homebrew's LLVM and
renders through KosmicKrisp, Mesa's Vulkan driver on Metal, or through Mesa's
lavapipe in software. `docs/MACOS_PLAN.md` is the plan; this document is how
to build and run it and what is known about the platform.

**Status.** Everything here was written and checked on Linux without a Mac.
The `macos` job in `.github/workflows/pc.yml` is the first real macOS build.
The build files, `tools/weaken`, the interposition check and the Mach-O
link model are tested on Linux (below); the Mesa build, the final Apple link
and every run on macOS are not. Native arm64 maps nothing below 4 GiB ("The
4 GiB page zero"); the game no longer needs it to, which Linux shows by
running PIE with its arenas above 4 GiB.

## Building

Requirements: an Apple Silicon Mac, Xcode or its command line tools, and
Homebrew in its standard prefix `/opt/homebrew`. KosmicKrisp needs macOS 26
(it is built on Metal 4); lavapipe runs on any macOS Homebrew supports.

```sh
brew install llvm lld cmake ninja python glslang sdl3 vulkan-headers vulkan-loader vulkan-tools
scripts/host/mesa-macos.sh                 # KosmicKrisp and lavapipe, into ~/.local/mesa/<tag>
cmake --preset macos-arm64                 # build/macos-arm64, Debug
cmake --build --preset macos-arm64
ctest --preset macos-arm64                 # with VK_DRIVER_FILES set, below
```

`macos-arm64-release` is the Release variant (`build/macos-arm64-release`).
The presets (`CMakePresets.json`) set:

- `CMAKE_CXX_COMPILER=/opt/homebrew/opt/llvm/bin/clang++`. Apple's clang is
  not current enough for the port's C++26; Homebrew's `llvm` is keg-only, so
  the path is spelled out. Override it on the command line for another
  prefix.
- `CMAKE_EXE_LINKER_FLAGS` linking Homebrew's own libc++ and libunwind (the
  flags Homebrew's `llvm` caveats give). The compiler uses that libc++'s
  headers; linking the system's older libc++ instead can leave newer library
  symbols unresolved.
- `CMAKE_OSX_ARCHITECTURES=arm64` and `CMAKE_OSX_DEPLOYMENT_TARGET=14.0`.
  The executable itself needs nothing newer: it links only SDL3, the Vulkan
  loader and Homebrew's libc++, and reaches Metal through the driver, which
  the loader opens at run time. 14 is the oldest macOS Homebrew still ships
  arm64 bottles for, so the same preset gives a binary that runs on every
  Mac the dependencies install on (KosmicKrisp then needs 26; lavapipe and
  MoltenVK do not). On a newer host `ld` warns that the bottles were built
  for a newer macOS than the target; that is expected.
- `CMAKE_PREFIX_PATH` with Homebrew's `llvm` (for `llvm-objcopy`, `llvm-nm`,
  `llvm-objdump`, `llvm-readobj`, `llvm-lipo`), `sdl3`, `vulkan-headers`,
  `vulkan-loader` and `glslang`.

`lld` is only for `dcdata`, whose CMakeLists links with `-fuse-ld=lld`
(`ld64.lld` on macOS). Python 3 runs the interposition check.

The Linux presets are `linux-x64` (`build/pc`, Debug, `clang++-20`, the same
directory and settings as the command line in `docs/PC.md`, which keeps
working) and `linux-x64-release` (`build/pc-release`).

### Mesa

`scripts/host/mesa-macos.sh [PREFIX]` builds a pinned Mesa tag
(`mesa-26.2.4`) from `gitlab.freedesktop.org` with meson:
`-Dplatforms=macos -Dvulkan-drivers=kosmickrisp,swrast -Dgallium-drivers=
-Dopengl=false -Dzstd=disabled --prefer-static`, GLES, EGL and GLX off, LLVM
on, release build, installed under PREFIX (default `~/.local/mesa/<tag>`).
It installs what Mesa's KosmicKrisp page lists through Homebrew (`llvm`,
`libclc`, `spirv-llvm-translator`, `spirv-tools`, `pkgconf`, `cmake`,
`ninja`, `bison`, `flex`, `python`) and meson, mako, packaging and PyYAML at
pinned versions into a virtual environment. Mesa is compiled by Apple's
clang; only `llvm-config` comes from Homebrew. A prefix already holding the
tag's build is reused (`--force` rebuilds); `MESA_TAG`, `MESA_REPO` and
`MESA_WORK` override the tag, the clone URL and the work directory. It
ends by printing the two lines to use:

```sh
export VK_DRIVER_FILES=~/.local/mesa/mesa-26.2.4/share/vulkan/icd.d/kosmickrisp_mesa_icd.aarch64.json ...
export VK_DRIVER_FILES=~/.local/mesa/mesa-26.2.4/share/vulkan/icd.d/lvp_icd.aarch64.json ...
```

(the manifest's architecture suffix is meson's name for the host CPU; the
script finds the files rather than assuming it).

Why that tag: `mesa-26.2.4` is the newest release tag found on a GitHub
mirror of Mesa (`FireBurn/mesa`; tags `mesa-26.2.5` and `mesa-26.3.0` did
not exist there, its `main` reads `26.3.0-devel`), and it carries
`docs/drivers/kosmickrisp.rst` and `src/kosmickrisp`. KosmicKrisp is first
released in 26.0: `mesa-25.3.0`'s `meson.options` has no `kosmickrisp`
among the Vulkan drivers. Commit hashes could not be read from here, so the
script records the commit it built in `PREFIX/.dcdecomp-mesa`.

## Running

```sh
export VK_DRIVER_FILES=<the KosmicKrisp line>     # or lavapipe
build/macos-arm64/darkcloud --data data --save save
```

Options, environment and exit statuses are those of `docs/PC.md`.
`VK_ICD_FILENAMES` is the older name of `VK_DRIVER_FILES`; the script prints
both. Without either, the loader searches `~/.config`, `/etc/xdg`,
`/usr/local/etc`, `/etc`, `~/.local/share`, `/usr/local/share` and
`/usr/share` under `vulkan/icd.d` (and an app bundle's
`Contents/Resources/vulkan/icd.d` first), not Homebrew's prefix.

If SDL cannot find the loader (`SDL_Vulkan_LoadLibrary` errors), point it at
Homebrew's: `SDL_VULKAN_LIBRARY=$(brew --prefix vulkan-loader)/lib/libvulkan.1.dylib`.
dyld's fallback search does not include `/opt/homebrew/lib`.

Headless runs: `--headless` uses SDL's offscreen driver with
`VK_EXT_headless_surface`. Lavapipe has it. **KosmicKrisp does not** when
built for macOS, so a headless run on KosmicKrisp needs the renderer's
surface-less mode (`docs/MACOS_PLAN.md`, 4.2); a windowed run uses
`VK_EXT_metal_surface`, which it has.

## How the macOS build differs

`src/port/CMakeLists.txt` keeps the mechanism of `docs/PC.md` ("How
`src/port` takes precedence") and changes the tools:

| Step | Linux | macOS |
|---|---|---|
| Merge `src/ps2` | `ld.lld -r` | Apple's `ld -r -keep_private_externs` (`ld64.lld` prints "Option `-r' is not yet implemented" in LLVM 20) |
| Weaken | `llvm-objcopy --weaken` | the same (it sets `N_WEAK_DEF` on Mach-O), or `tools/weaken` with `-DDC_MACHO_WEAKEN=tool`; both write identical bytes |
| Keep calls replaceable | `-fPIC -fsemantic-interposition` | `-Xclang -fsemantic-interposition -fno-inline-functions` |
| Final link | `-fuse-ld=lld -pie --gc-sections --defsym` | Apple's `ld`, `-dead_strip`, `-alias`, PIE |
| `EditGaijiTbl` | `src/port/linknames.cpp` on both (below) | |
| FP contraction | `-ffp-contract=off` on both (a no-op on x86-64) | |

Duplicate strong definitions among `src/ps2`'s objects are an error on both
platforms; none exist, and Apple's `ld -r` has no
`--allow-multiple-definition`.

**Interposition.** The driver accepts `-fsemantic-interposition` only for
ELF. Mach-O functions are not `dso_local` in clang's IR, so the flag passed
to cc1 makes LLVM treat them as interposable, as on Linux. Without it,
`-fno-inline-functions` stops inlining but not IPO: at `-O2` a call to a
function that returns a constant is folded to the constant and a call to an
empty function is deleted, so a replacement of either would never run (tested
with `--target=arm64-apple-macos14`).

**`ps2_interposition_check`** is part of every build on both platforms. It
disassembles `dc_ps2.o` and fails when a call or tail call from a
non-replaced function to a function `src/port` defines strongly was bound
inside the object (an ELF `.Lname$local` alias, a relocation against the
callee's own section, a Mach-O branch to a local label) rather than through
a relocation against the name, and when any definition in `dc_ps2.o` is
still strong. Calls the optimiser removed outright cannot be seen there; the
compile flags above prevent those. Linux Debug: 21,775 calls, 248 replaced
symbols, Release: 20,328, both clean. `-DDC_INTERPOSITION_CHECK=OFF` turns
it off.

**Aliases.** `-Wl,-alias,_ItemPutListTbl12,_ItemPutListTbl12_bytes`, and
the same for `draw_rect_store`/`draw_rect` and `WorkBuffer`/`WorkBuffer__2`.
`EditGaijiTbl` is `GaijiDataTbl + 0x601C` on the PS2 link, and `-alias`
takes no offset (the assembler cannot express `.set sym, undefined + off` on
Mach-O either: it silently emits an undefined symbol). `linknames.cpp`
therefore owns 0x300 entries of storage, copies the overlapping words from
`GaijiDataTbl` in a constructor before `main` (nothing writes the table),
and names the storage's end `EditGaijiTbl` with `.set`; Mach-O marks that
symbol an alt entry, so dead stripping keeps it with its storage. Linux uses
the same definition, which `integration_link_aliases` checks.

**`tools/weaken`** is a std-only C++26 tool: for each 64-bit little-endian
Mach-O `MH_OBJECT` (arm64 or x86_64) it sets `N_WEAK_DEF` on every symbol
with `N_EXT` and `N_TYPE == N_SECT` and no stab bits, and replaces the file
by rename. Exit status 0, 1 for usage, 2 for I/O, 3 for anything that is not
such an object; universal files are refused with a pointer to `lipo -thin`.

## The 4 GiB page zero

Native arm64 macOS executables cannot map anything below 4 GiB. XNU's
`bsd/kern/mach_loader.c` (`load_machfile`, the same at `xnu-8792.41.9`,
`xnu-10002.1.13`, `xnu-11215.1.10` and `main`) refuses to exec a 64-bit
`CPU_TYPE_ARM64` image unless the map's minimum offset is at least 4 GiB:

```c
/* 64 bit ARM binary must have "hard page zero" of 4GB to cover the lower 32 bit address space */
if (vm_map_has_hard_pagezero(map, 0x100000000) == FALSE) { ... return LOAD_BADMACHO; }
```

`vm_map_has_hard_pagezero` is `map->min_offset >= size`, and the page zero
raises `min_offset`, so with a legal binary no `mmap`, hinted or fixed, can
return an address below 4 GiB. `-pagezero_size 0x1000` produces a binary
the kernel will not run (and on 16 KiB pages it is not even a page; `ld64.lld`
rounds it to 0).

The game does not need low memory: every cast of a pointer to a 32-bit
integer whose value comes back as a pointer is widened in `src/port`
(`docs/port/truncations.md`), the arenas are ordinary mappings and the Linux
executable is PIE too, so `ld` keeps its default page zero and no x86_64
build under Rosetta 2 is needed.

## What CI verifies

The `macos` job runs on `macos-26` (arm64, Metal 4):

1. Homebrew dependencies; Mesa through the script, restored from and saved
   to a cache keyed by tag and script hash right after it is built.
2. `vulkaninfo --summary` for lavapipe and for KosmicKrisp, kept as
   artifacts.
3. `cmake --preset macos-arm64`, build (including `tools/weaken`'s and the
   interposition check's ctests, and the check itself on the real Mach-O
   `dc_ps2.o`), and `ctest` on lavapipe. This decides the job.
4. `darkcloud --headless --frames 3 --screenshot` on KosmicKrisp, then the
   same in a window. No game data: one stand-in file gets it through
   renderer start-up and the pipeline compilation to the first asset load,
   which exits 4 naming the file, so 0 or 4 counts as success. Both steps
   are `continue-on-error` until the first green run; their logs and any
   screenshot are uploaded.

## KosmicKrisp, as verified

Read from Mesa `mesa-26.2.4` (`src/kosmickrisp/vulkan`, `meson.build`,
`meson.options`, `docs/drivers/kosmickrisp.rst`) through the GitHub mirror;
nothing here has been run.

- Vulkan 1.4 device (`kk_get_vk_version`: `VK_MAKE_VERSION(1, 4, VK_HEADER_VERSION)`,
  manifest `--api-version 1.4`); its own `vkEnumerateInstanceVersion` says
  1.3, which the loader's answer supersedes.
- Features the renderer needs, all advertised: `dualSrcBlend`,
  `shaderClipDistance`, `dynamicRendering`, `synchronization2`,
  `descriptorIndexing` with `descriptorBindingSampledImageUpdateAfterBind`,
  `descriptorBindingPartiallyBound`, `descriptorBindingVariableDescriptorCount`,
  `runtimeDescriptorArray` and `shaderSampledImageArrayNonUniformIndexing`;
  update-after-bind sampled image limits of 2^20 (`KK_MAX_DESCRIPTORS`).
- `VK_FORMAT_D32_SFLOAT_S8_UINT` maps to Metal's native depth32/stencil8
  (`Z32_FLOAT_S8X24_UINT` in `kk_format.c`). There is no D24S8.
- `VK_EXT_extended_dynamic_state3` is exposed **without**
  `extendedDynamicState3ColorWriteMask`: the renderer's pipeline-variant
  fallback for colour write masks is the path taken.
- No `VK_KHR_portability_subset`, and the manifest is not marked
  `is_portability_driver`, so no portability enumeration is needed for it.
- Instance surfaces when built with `-Dplatforms=macos`: `VK_EXT_metal_surface`
  yes, `VK_EXT_headless_surface` no (`#ifndef VK_USE_PLATFORM_METAL_EXT`).
- Requirements: Metal 4, so macOS 26; Xcode; meson 1.9.1+, LLVM 20.1.8+,
  libclc, SPIRV-LLVM-Translator, SPIRV-Tools; Python with mako, packaging,
  PyYAML. Mesa's own `meson.build` asks for meson 1.4 and forces beta
  Vulkan extensions on Darwin.
- Manifest `kosmickrisp_mesa_icd.<cpu>.json` (plain `kosmickrisp_mesa_icd.json`
  with `-Dvulkan-manifest-per-architecture=false`) in
  `<prefix>/share/vulkan/icd.d`, naming `libvulkan_kosmickrisp.dylib`.
  Lavapipe's is `lvp_icd.<cpu>.json`; it has `VK_EXT_headless_surface` and
  `VK_EXT_metal_surface`.
- Debugging: `MESA_KK_DEBUG=msl` logs every generated MSL shader,
  `MESA_KK_GPU_CAPTURE=1` records a Metal capture,
  `MESA_KK_DISABLE_WORKAROUNDS` turns workarounds off.

## Known unknowns

- Whether the whole thing builds: Homebrew LLVM's acceptance of the port's
  flags on Darwin, Apple `ld -r` on 136 objects, the final link with
  `-dead_strip` and the aliases (the link model was checked on Linux with
  `ld64.lld` and freestanding arm64 objects: strong beats weak, the weak
  caller branches to the replacement, `-alias` and the alt-entry
  `EditGaijiTbl` resolve, unused weak code is stripped), and Mesa's build
  with the script's options.
- The game at run time on arm64: pointers truncated to 32 bits (above).
  Expect faults until `docs/MACOS_PLAN.md` section 3 is done.
- Tests that assume Linux: `integration_smoke_test.cpp` finds `darkcloud`
  through `/proc/self/exe`.
- KosmicKrisp: pipeline compilation time for the 504 start-up pipelines
  (NIR to MSL to Metal) and whether the on-disk `VkPipelineCache` saves it
  on the second run; correctness of dual-source blending and the stencil
  paths on Metal; the instance version of 1.3 against the renderer's
  requirement of 1.4 if the loader ever reports the driver's.
- Whether GitHub's `macos-26` runners expose a Metal 4 device to
  KosmicKrisp from a non-interactive job, and whether windowed runs get a
  window server there.
