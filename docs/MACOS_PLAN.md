# macOS and Apple Silicon support plan

This plan brings the PC port (`docs/PC.md`, `docs/PC_PORT_PLAN.md`) to macOS on
arm64, rendering through KosmicKrisp, Mesa's Vulkan driver on top of Metal.
Nothing here changes the port's rules: C++26, SDL3, native Vulkan, weak-linkage
replacement, no PS2 emulation, no edits under `src/ps2`.

## 1. What KosmicKrisp is, and what must be checked

KosmicKrisp is LunarG's Vulkan driver in Mesa (merged for Mesa 25.3) that
implements Vulkan on Apple's Metal API, with shaders compiled from NIR to the
Metal Shading Language. It is a normal Mesa ICD, loaded by the Khronos Vulkan
loader on macOS like any other driver, and it was announced as Vulkan 1.3
conformant on Apple Silicon. The documentation (`docs.mesa3d.org/drivers/kosmickrisp.html`)
and the Mesa tree were not reachable from the environment this plan was written
in, so the implementing agents verify, against the Mesa source they build, every
item marked **[verify]**:

- **[verify]** The Vulkan API version KosmicKrisp reports (1.3, or 1.4 in a
  newer Mesa). The renderer currently requires 1.4 (section 4.2).
- **[verify]** Device features the renderer requires: `dualSrcBlend`,
  `shaderClipDistance`, descriptor indexing with update-after-bind sampled
  images (8192), dynamic rendering, synchronization2, `D32_SFLOAT_S8_UINT` as a
  depth/stencil attachment, and the optional
  `VK_EXT_extended_dynamic_state3` colour write mask (a pipeline-variant
  fallback exists).
- **[verify]** Whether it reports `VK_KHR_portability_subset`; if so the
  instance must enable `VK_KHR_portability_enumeration` and set
  `VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR`, and the subset's
  restrictions must be checked against the renderer's use (point size,
  triangle fans, separate stencil masks, image view formats).
- **[verify]** Surface support: `VK_EXT_metal_surface` through SDL3 (SDL3's
  macOS Vulkan path), and whether `VK_EXT_headless_surface` exists; if not,
  headless runs need the renderer's own surface-less mode (section 4.3).
- **[verify]** The meson options and macOS/Xcode minimums
  (`-Dvulkan-drivers=kosmickrisp`, plus `swrast` for lavapipe on macOS), the
  installed ICD name (`kosmickrisp_icd.json`) and where the loader looks for
  it (`/usr/local/share/vulkan/icd.d`, `~/.local/share/vulkan/icd.d`,
  `VK_DRIVER_FILES`).
- **[verify]** Pipeline compilation cost: NIR to MSL plus Metal's own compile
  makes the 504 startup pipelines slower than on lavapipe; the on-disk
  `VkPipelineCache` must demonstrably work (Metal binary archives behind it).

MoltenVK is not used: the point of this work is a Mesa driver with a shared
shader compiler and Vulkan 1.3 conformance; MoltenVK stays an undocumented
alternative that may happen to work through the same loader.

## 2. What is Linux-specific today

| Area | File | Linux assumption | macOS answer |
|---|---|---|---|
| Arenas | `src/port/dataset.cpp` | `mmap(MAP_32BIT)` keeps arenas below 2 GiB so the game's `(int)` pointer casts survive; `madvise(MADV_DONTNEED)` zeroes | Impossible on arm64 (section 3): arenas live wherever `mmap` puts them and every pointer round trip is widened instead; zero with `memset` or `MADV_FREE_REUSABLE` |
| Executable path | `src/port/platform/paths.cpp` | `/proc/self/exe` | `_NSGetExecutablePath` + `realpath` |
| Executable layout | `src/port/CMakeLists.txt` | `-no-pie` keeps `.data`/`.bss` below 4 GiB | arm64 macOS is PIE-only, loads images above 4 GiB and forbids low mappings; nothing may depend on a 32-bit round trip (section 3) |
| Weakening | `src/port/CMakeLists.txt` | `ld.lld -r` then `llvm-objcopy --weaken` on ELF | `ld -r` works on Mach-O; `--weaken` on Mach-O is **[verify]**. Fallback: `tools/weaken`, a small Mach-O symbol-table patcher that sets `N_WEAK_DEF` on every defined symbol of the merged object |
| Interposition | `-fsemantic-interposition` | ELF-only flag; stops clang inlining calls to functions the port replaces | Mach-O has no equivalent flag. Compile `src/ps2` with `-fno-inline-functions -fno-inline-small-functions` (or `-fno-inline`) on macOS and add a build check that disassembles `dc_ps2.o` for direct calls into replaced symbols |
| Link flags | `-fuse-ld=lld -Wl,--gc-sections -Wl,--defsym=…` | GNU-style | `-Wl,-dead_strip`; `--defsym` aliases become `-Wl,-alias,_from,_to` (ld64) or `ld64.lld` equivalents; `--error-limit` dropped |
| Toolchain | clang 20 from apt | | Homebrew `llvm` (20+) and `lld`; Apple clang is not current enough for C++26 |
| Shader build | `glslangValidator` from apt | | Homebrew `glslang` |
| Dependencies | SDL3 and Vulkan from `/usr/local` | | Homebrew `sdl3`, `vulkan-headers`, `vulkan-loader`, `vulkan-validationlayers`; Mesa built from source for KosmicKrisp and lavapipe |
| Floating point | x86-64 SSE, no FMA contraction by default | | arm64 clang contracts `a*b+c` into FMA by default; `src/ps2` must be compiled with `-ffp-contract=off` so game math matches the x86-64 build bit for bit |
| `strings.h` | `include/port/port.h` | glibc | present on macOS; keep |
| CI | `.github/workflows/pc.yml` Ubuntu | | add a `macos-15` (Apple Silicon) job |

## 3. The 32-bit pointer problem on arm64 macOS

The game casts pointers to `int` in places (`docs/PC.md`, "Keeping the PS2
build matching"). On Linux the executable is non-PIE, so globals sit below
4 GiB and round-trip, and the arenas are mapped below 2 GiB.

On arm64 macOS neither is possible. XNU's Mach-O loader requires every native
arm64 executable to have a 4 GiB hard `__PAGEZERO` (`bsd/kern/mach_loader.c`,
`enforce_hard_pagezero`, checked from macOS 13 through 15 and `main`): a
binary linked with a smaller `-pagezero_size` is refused at exec, and the
process's address map starts at 4 GiB, so no `mmap`, hinted or fixed, can
ever return a low address. A low-memory arena therefore cannot exist on
arm64 macOS. The rule is keyed on `CPU_TYPE_ARM64`; an x86-64 build run under
Rosetta 2 only needs a 4 KiB page zero.

So the port stops relying on 32-bit round trips altogether:

1. **Audit tool.** `scripts/port/truncations.py` runs libclang over `src/ps2`
   and `src/port` with the port's compile flags and lists every cast of a
   pointer to a 32-bit integer, classified as a **round trip** (cast back to
   a pointer, stored in an `int` field or global later read as a pointer,
   or subtracted against another truncated pointer) or **low bits only**
   (alignment masks, modulo, hashing), with the enclosing function and
   whether that function is already a port replacement. Output committed as
   `docs/port/truncations.md`.
2. **Proof on Linux.** The arenas can be forced above 4 GiB on Linux
   (`platform/memory`'s high path), which reproduces the arm64 macOS
   condition exactly; the test suite and the real-data boot run that way.
3. **Per-site fixes**, all in `src/port`: every round-trip site in a port
   replacement unit or on the boot path is widened to keep a real pointer;
   round-trip sites that remain in retail functions are listed with the
   replacement each needs, and replaced one by one like any hardware
   dependence. Known cases: `BtEventData = (s32) arena`, the `EPARTS_*`
   records, the script VM's `funcdata` (`dataio.md`, section 2.4), the title
   units' `(int)` arithmetic.
4. **Fallback.** Until the retail list is empty, an x86-64 build under
   Rosetta 2 is the way to run on Apple Silicon; the build keeps an
   `x86_64` variant of the macOS preset for it, with `-pagezero_size 0x1000`
   and the Linux-style low arena.

No memory mapping of PS2 address ranges is introduced on any platform.

## 4. Work packages

### 4.1 Build system and toolchain (one agent)

- `CMakePresets.json`: `linux-x64` (today's build) and `macos-arm64`
  (Homebrew LLVM, `-DCMAKE_OSX_ARCHITECTURES=arm64`, deployment target the
  Mesa build needs **[verify]**, Homebrew prefix for SDL3, Vulkan and glslang).
- `src/port/CMakeLists.txt` split per platform: the merge-and-weaken step
  (`ld -r` + `llvm-objcopy --weaken` or `tools/weaken`), link flags
  (`-dead_strip`, `-alias` for `ItemPutListTbl12_bytes`, `draw_rect`,
  `WorkBuffer__2`, `EditGaijiTbl`), `-pagezero_size`, no `-no-pie`, the
  interposition substitute, `-ffp-contract=off` for `src/ps2`.
- `tools/weaken` (C++26, std only): reads a Mach-O object, sets `N_WEAK_DEF`
  on every defined external symbol, writes it back; with a unit test on a
  tiny object produced in the test. Built only when needed, but kept
  portable so the Linux build also compiles it.
- `scripts/host/mesa-macos.sh`: builds a pinned Mesa tag with meson for
  `kosmickrisp` and `swrast`, installs under a prefix, writes the ICD files,
  prints the `VK_DRIVER_FILES` line. Everything pinned.
- `.github/workflows/pc.yml`: a `macos-15` job that installs Homebrew
  dependencies, builds Mesa through the script (cached by Mesa tag), builds
  the port with the preset, runs `ctest` headless on lavapipe, then runs
  `darkcloud --headless --frames 3 --screenshot` on KosmicKrisp with
  `VK_DRIVER_FILES` pointing at it (the runners have a Metal-capable GPU)
  and uploads the screenshot and `vulkaninfo --summary` as artifacts.
- `docs/MACOS.md`: how to build and run on a Mac, what is verified in CI,
  the KosmicKrisp facts from section 1 once verified.

### 4.2 Platform and renderer portability (one agent)

- `platform/paths.cpp`: `_NSGetExecutablePath`; `platform/clock.cpp`,
  `input.cpp`, `audio.cpp`, `window.cpp`: audit for POSIX or Linux calls,
  `SDL_GetWindowSizeInPixels` on Retina (already used), the Metal-backed
  window flags SDL3 needs for Vulkan on macOS.
- `dataset.cpp` arenas: `platform/memory.{hpp,cpp}` with the Linux low
  (`MAP_32BIT`) path, a high path (macOS, and forced on Linux for the proof
  in section 3) and a common zeroing call.
- Renderer: instance creation enables portability enumeration when the
  extension exists; device selection accepts a 1.3 device when every feature
  the renderer uses is present (explicit `VkPhysicalDeviceVulkan13Features`
  and extension checks) and reports exactly which requirement a rejected
  device lacks; `VK_KHR_portability_subset` restrictions handled where they
  touch the renderer (triangle fans are used by `Draw2D`: emulate as lists on
  a device that lacks them). A surface-less mode (`--headless` without
  `VK_EXT_headless_surface`): render to the main target and skip the
  swapchain, with `ReadbackFrame` still working. Depth-format fallback stays.
- Pointer-truncation audit tool and the fixes of section 3.
- Tests: the existing suite must stay green on Linux; new tests for
  `LowMemoryMap` (result below 4 GiB, guard page), the triangle-fan fallback,
  the surface-less mode (on lavapipe, forced by a config flag), and the audit
  tool's output format.

### 4.3 Verification

This environment is Linux x86-64 without a Mac, so the macOS build is
verified by the CI job in 4.1 and by the user's Mac. Everything portable is
tested on Linux first (the surface-less mode, the fan fallback, the low-memory
mapper, `tools/weaken` on a Mach-O object written by its test). The agents
report what they could not run.

## 5. Risks

- KosmicKrisp may lack a feature the renderer needs (dual-source blending or
  8192 update-after-bind images are the likeliest). Fallbacks: the blend
  table's non-dual-source variants (more pipelines, documented approximations
  in `gfx/README.md`), and a smaller texture array with per-frame descriptor
  updates.
- `llvm-objcopy --weaken` on Mach-O may be unsupported; `tools/weaken` is the
  planned fallback and costs a day, not a redesign.
- Pointer truncation sites in retail code reached through still-retail
  functions cannot be fixed without replacing those functions; the audit
  lists them and they are replaced one by one like any hardware dependence.
- Pipeline precompilation on Metal may take tens of seconds on first run;
  the progress callback and the cache make this a one-time cost.
