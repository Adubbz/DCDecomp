# PC port

`PLATFORM=PC` builds the game's code as an x64 Linux program with clang, as
C++26. The port is always the PAL release; there is no region setting.

```sh
./dev.sh cmake -S . -B build/pc -G Ninja -DPLATFORM=PC
./dev.sh ninja -C build/pc
```

The result is `build/pc/darkcloud`. It links against SDL3 and the Vulkan loader
(`libsdl3-dev` and `libvulkan-dev` in the dev image) and needs a GPU with
Vulkan 1.4 to run.

The game's start-up still reaches PlayStation 2 code the port does not
implement, so for now `main` only opens the window and presents cleared frames
until it is closed. Every other piece of PlayStation 2 code is a stub that
asserts.

## Platform

`src/port/platform` and `src/port/gfx` are the host side. They build without
`port.h` or the game's include paths, so no game header or SDK type can reach
them:

- `platform/window.cpp` starts SDL3, opens a resizable window (1280x960 unless
  `--width`/`--height` say otherwise; `--headless` uses SDL's offscreen
  driver) and pumps its events.
- `gfx/` is a Vulkan 1.4 renderer: one graphics queue that presents, two
  frames in flight, dynamic rendering, synchronization2, bindless textures,
  every pipeline created at start-up against `save/pipeline_cache.bin`, and an
  immediate draw API in the game's 640x480 logical space and in 3D.
  `src/port/gfx/README.md` is its contract.

`MGBeginFrame` and `MGEndFrame` (`src/port/mglib.cpp`) begin and present a
frame. `--frames N` exits after N frames and `--screenshot PATH` writes the
last one as a PNG. The Khronos validation layer is enabled when it is
installed, always in a build without `NDEBUG` and otherwise when
`DC_VULKAN_VALIDATION` is set.

## Layout

The root `CMakeLists.txt` only picks the platform:

- `src/ps2` is the game's code, exactly as the PS2 build compiles it, and
  nothing else. Port accommodations never live in `src/ps2` or `include/ps2`;
  the one exception is the `#ifndef PORT` around functions written in
  assembly (below).
  `src/ps2/CMakeLists.txt` (with `src/ps2/cmake/`) is the PS2 build.
- `src/port` is code only the port compiles. `src/port/CMakeLists.txt` is the
  port's build.
- `include/ps2` holds the game's headers and, under `include/ps2/sce` and
  `include/ps2/std`, the SDK and standard headers MWCC compiles against. Both
  builds use them.
- `include/port` holds headers only the port uses: `port.h`, included ahead
  of every unit it compiles, and `stubs/` (below).

## How `src/port` takes precedence

`src/port/CMakeLists.txt` builds the two halves like this:

1. Every unit in `src/ps2` is compiled as it is, with `PORT` defined.
2. The objects are merged into one relocatable object, `build/pc/dc_ps2.o`,
   and `llvm-objcopy --weaken` makes every definition in it weak. References
   stay strong, so a missing function is still a link error.
3. The units in `src/port` are compiled and linked with it. Their definitions
   are strong, so any function or variable `src/port` defines replaces the
   `src/ps2` one. `--gc-sections` then drops the `src/ps2` body.

`src/ps2` units are compiled with `-fPIC -fsemantic-interposition`. That stops
clang from inlining or folding a call to a function `src/port` may replace, so
calls inside a `src/ps2` unit reach the replacement too.

To replace a function, define it with the same signature in `src/port`. By
convention it goes in the file that mirrors its unit: `src/port/mglib.cpp`
holds the replacements for `src/ps2/mglib.cpp`. A `static` function cannot be
replaced this way; it keeps the body `src/ps2` gives it.

## What is stubbed

A stub calls `PS2_UNIMPLEMENTED()` (`include/port/port.h`), which
prints the function, file and line, then aborts. Every stub the port defines
is in `src/port/stubs/`, in the file named after the source it replaces:
`src/port/stubs/<unit>.cpp` for a unit of `src/ps2`, and
`src/port/stubs/sce/<library>.cpp` for a library of `include/ps2/sce`. The
stubs are:

- **The SDK.** Every function declared in `include/ps2/sce`, except libvu0,
  which is implemented (below).
- **The hardware.** Functions that read or write PS2 registers or the
  scratchpad directly: `VSyncCallBack_Load` and
  `CVisualShadow::CreateVUdataShadowCLIP`. `main`, `MGBeginFrame` and
  `MGEndFrame` are replaced by the platform layer instead.
- **The Metrowerks runtime.** The C++ runtime and overlay loader at the top of
  `src/ps2/mathutil.cpp` compile, but `mwInit`, the one entry point the game
  calls, is stubbed.

- **MWCC inline assembly.** Every function in `src/ps2` that is written in
  MIPS assembly, in whole or in part: `VectorMax`, `MulMatrix`,
  `InitializeDataBuffer`, the `Align64` functions, `vuabs`, the frame matrix
  helpers and the rest.

Clang cannot compile MWCC's MIPS `asm {}` blocks, so each function that uses
one sits behind `#ifndef PORT` in `src/ps2`; the port defines `PORT` and gets
the function from `src/port/stubs/<unit>.cpp` instead. The directives take the place of the
blank lines around the function, so no line in the unit moves. A `static` one
is still called from its own unit, so `include/port/stubs/<unit>.hpp` declares
it (below).
Two that share a name across units (`vuabs`, `StretchBind2`, `vu_hold_box`,
`vu_box_missed`) share one stub. `CDataAlloc2<1>::CDataAlloc2()`, which only
delegates, is implemented in `src/port/dataalloc.cpp` rather than stubbed.

`src/port/runtime.cpp` implements, rather than stubs, the runtime calls with a
host equivalent: `__assert` (in its Metrowerks argument order) and `exit__2`.

`src/port/sce/libvu0.cpp` implements libvu0 in C++, since static constructors
call it before `main`. Each function writes the lanes the library's VU0 code
writes (`sceVu0Normalize` and `sceVu0OuterProduct` zero w, the `XYZ` variants
keep it, `sceVu0RotMatrix` applies Z, then Y, then X). The rotations use the
host's `sin` and `cos` rather than the library's polynomial, and
`sceVpu0Reset` does nothing.

## Per-unit adjustments

`include/port/stubs/<unit>.hpp`, if it exists, is included ahead of
`src/ps2/<unit>.cpp`, after `port.h`, and nothing else. It declares what the
port defines in place of code `PORT` leaves out, and supplies or renames what
the unit takes from MWCC alone:

- `bound`, `cloth`, `collisionmdt`, `frame`, `gameutil`, `mglib`, `visualvu1`
  and `water` get declarations of their `static` assembly functions, which
  `src/port/stubs/` defines.
- `battlemenu` and `editground` pass each temporary `CRect_i_` as an lvalue
  (`Ps2Lvalue`, `include/port/port.h`): MWCC binds a temporary to the non-const
  references of `DrawMenuColorGradation` and `CEditGround::CheckPartsRect`.
- `main` gets an overload of `LoadFileMenuData` for a `const char *`: one call
  names its file with a comma expression ending in a string literal.
- `mathutil` gets the Metrowerks runtime's own `std::exception` and
  `std::bad_exception` renamed apart from the host library's, and
  `__exception_magic`, which MWCC provides inside an exception handler.

## Game headers

`include/port/port.h` adjusts two game headers for the host, from outside:

- `types.h` defines the PS2's `size_t` and `NULL`. `port.h` includes it with
  `size_t` renamed and `NULL` saved, so the host's stay in force, and
  `#pragma once` keeps the game from including it again.
- `common.h` defines `STATIC_ASSERT`, which checks the PS2's layouts. `port.h`
  includes it and redefines the macro to check nothing.

## Names the PS2 build renames

`main.cpp` calls other units through the names MWCC gives them
(`init_all__Fv`) and calls the overlays' entry points through their retail
addresses (`func_01DAC1C0`). `src/port/main.cpp` forwards each one to the real
function. `ItemPutListTbl12_bytes` is a second name for `ItemPutListTbl12`,
given at link time with `--defsym`.

The PS2 build tells apart a few same-named definitions in different units by
renaming them per object (`config/*/object_fixups.json`). The port has no
equivalent yet, so the merge keeps the first definition of each name:

- `FaceChange(int)` in title's op_b, op_c, op_d and rushmovi.
- `MainDraw()` and `MoveChara()` in editloop and in the DUN overlay's
  gameloop.
- `Chara`, `MainCamera`, `NowCamera`, `TalkCamera`, `NowTime`, `TexAnimeData`,
  `camera_dist_mode`, `door_open_cnt`, `fix_chara_pos`, `fix_chara_rot`,
  `goto_menu`, `goto_return_menu`, `key_counter` and `loop_counter` in edit_in
  and editloop. edit_in redeclares them `static` after a header declares them
  `extern`. MWCC makes them file-local; clang's `-fms-extensions` keeps them
  global.

## Keeping the PS2 build matching

Edits to `src/ps2` or `include/ps2` that help clang must leave both PS2 builds
byte-identical. They are corrections that are standard C++ either way, never
code for the port:

- **Initialisations a `switch` jumps over.** They are split into a declaration
  and an assignment.
- **Language linkage.** `BtEnemyLayoutList` and `BtUraEnemyLayoutList` are
  declared `extern "C"` to match their definitions.
- **Exception specifications.** `__dl` is declared `throw()`, as it is
  defined.
- **`#ifndef PORT` around assembly functions**, the one exception: clang
  cannot parse them. It replaces blank lines, so no line number moves. The
  generic `CDataAlloc<Kind, Size>::Align64()` in `include/ps2/dataalloc.hpp`
  is guarded too; nothing instantiates it, since both arenas specialise it.

Retail's own mistakes stay in `src/ps2`, because the match reproduces them:
locals read before anything sets them (`SaveToMc`'s `status`, `main`'s
`idle_result` and six more), non-void functions that fall off the end,
format strings that do not fit their arguments. Initialising any of the
locals changes what MWCC emits. The port gives them defined behaviour
instead:

- `-ftrivial-auto-var-init=zero`: locals start at zero.
- `-fno-strict-return`: falling off the end returns an unspecified value
  instead of being undefined.
- `-fno-strict-aliasing` and `-fwrapv`: the type punning and wraparound the
  code assumes.

`src/ps2` is compiled with `-Wall`. The warnings left on are the porting
work: uninitialised reads, missing returns, format strings, copies over
objects with a vtable and the like. Those that only describe how MWCC-era
code is spelled -- string literals as `char *`, MWCC's pragmas, 32-bit pointer
casts, the unused names and expressions matching leaves behind -- are off.

Clang also needs a few flags to accept code MWCC accepts:

- `-fms-extensions`: pointers truncated to `int`.
- `-Wno-c++11-narrowing`: narrowing in braced initialisers.
- `-Wno-register`: the `register` keyword.
- `-Wno-return-mismatch`: a bare `return;` in a non-void function.

The executable is linked without PIE so its code and data sit below 4 GiB.
Pointers the game casts to 32-bit integers therefore survive the round trip
for globals, though not for the heap or stack.

## Checking the PS2 build

An edit to `src/ps2` or `include/ps2` made for the port is checked by building
both regions (`scripts/build/cmake.sh build`, and again with `REGION=PAL`),
which verifies every image byte for byte.
