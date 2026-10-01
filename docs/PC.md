# PC port

`PLATFORM=PC` builds the game's code as an x64 Linux program with clang, as
C++26. The port is always the PAL release; there is no region setting.

```sh
./dev.sh cmake -S . -B build/pc -G Ninja -DPLATFORM=PC
./dev.sh ninja -C build/pc
```

The result is `build/pc/darkcloud`. Every piece of PlayStation 2 code is a stub
that asserts, so for now the program stops at the first one it reaches -- a VU0
call made by a static constructor, before `main` runs.

## Layout

The root `CMakeLists.txt` only picks the platform:

- `src/ps2` is the game's code, exactly as the PS2 build compiles it, and
  nothing else: no `DC_PC` guards and no other accommodation for the port.
  `src/ps2/CMakeLists.txt` (with `src/ps2/cmake/`) is the PS2 build.
- `src/port` is code only the port compiles. `src/port/CMakeLists.txt` (with
  `src/port/cmake/`) is the port's build.

## How `src/port` takes precedence

`src/port/CMakeLists.txt` builds the two halves like this:

1. Every unit in `src/ps2` is copied into `build/pc/src/port/ps2/` with its
   MWCC inline assembly replaced (see below), and the copy is compiled.
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
replaced this way; it keeps whatever body the copy gives it.

## What is stubbed

A stub calls `PS2_STUB()` (`src/port/include/pc_prelude.h`), which prints the
function, file and line, then aborts.

- **The SDK.** `src/port/sce/<library>.cpp` stubs every function declared in
  `include/sce`.
- **MWCC inline assembly.** Clang cannot compile MWCC's `asm {}` blocks, so
  `src/port/cmake/StubAsm.cmake` rewrites them in the copy:
  - a block that is only `bne $0, $0, <label>` (the `Align64` functions) can
    never branch, so it is dropped;
  - any other block becomes `PS2_ASM()`, a stub, so a function using the
    vector unit aborts when it is reached;
  - a function written entirely in assembly keeps its declarator and gets
    `PS2_ASM()` as its body. `CDataAlloc2<1>::CDataAlloc2()` only delegates,
    so `src/port/dataalloc.cpp` gives the same thing in C++.

  Every rewrite keeps the line count, and the copy starts with a `#line`
  naming the `src/ps2` file, so diagnostics and stub reports point at the
  original.
- **The hardware.** Functions that read or write PS2 registers or the
  scratchpad directly: `main`, `MGBeginFrame`, `MGEndFrame`,
  `VSyncCallBack_Load` and `CVisualShadow::CreateVUdataShadowCLIP`.
- **The Metrowerks runtime.** The C++ runtime and overlay loader at the top of
  `src/ps2/mathutil.cpp` compile, but `mwInit`, the one entry point the game
  calls, is stubbed.

`src/port/runtime.cpp` implements, rather than stubs, the runtime calls with a
host equivalent: `__assert` (in its Metrowerks argument order) and `exit__2`.

## Unit shims

`src/port/shims/<unit>.h`, if it exists, is included ahead of the copy of
`src/ps2/<unit>.cpp` and nothing else. It supplies or renames what that unit
takes from MWCC alone:

- `mathutil.h` renames the runtime's own `std::exception` and
  `std::bad_exception` apart from the host library's, and declares
  `__exception_magic`, which MWCC provides inside an exception handler.

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

Edits to `src/ps2` or `include` that help clang must leave both PS2 builds
byte-identical:

- **Initialisations a `switch` jumps over.** They are split into a declaration
  and an assignment.
- **Language linkage.** `BtEnemyLayoutList` and `BtUraEnemyLayoutList` are
  declared `extern "C"` to match their definitions.
- **Exception specifications.** `__dl` is declared `throw()`, as it is
  defined.
- **`DC_PC` in `include` only.** Headers are not copied, so the few port
  accommodations they need stay behind `DC_PC`: `size_t`, `STATIC_ASSERT`
  (which checks the PS2 layout), the `asm` block in the `CDataAlloc` template
  and overloads that accept a temporary `CRect_i_` or a string literal where
  MWCC bound them to a non-const parameter.

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

An edit to `src/ps2` or `include` made for the port is checked by building
both regions (`scripts/build/cmake.sh build`, and again with `REGION=PAL`),
which verifies every image byte for byte.
