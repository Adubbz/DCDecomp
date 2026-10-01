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

## How `src/pc` takes precedence

`src/common` is the game's code, the same files the PS2 build compiles.
`src/pc` is code only the port compiles. cmake/PC.cmake builds them like this:

1. Every unit in `src/common` is compiled to an object.
2. The objects are merged into one relocatable object, `build/pc/dc_common.o`,
   and `llvm-objcopy --weaken` makes every definition in it weak. References
   stay strong, so a missing function is still a link error.
3. The units in `src/pc` are compiled and linked with it. Their definitions are
   strong, so any function or variable `src/pc` defines replaces the common
   one. `--gc-sections` then drops the common body.

Common units are compiled with `-fPIC -fsemantic-interposition`. That stops
clang from inlining or folding a call to a function `src/pc` may replace, so
calls inside a common unit reach the replacement too.

To replace a function, define it with the same signature in `src/pc`. By
convention it goes in the file that mirrors its common unit: `src/pc/frame.cpp`
holds the replacements for `src/common/frame.cpp`.

## What is stubbed

A stub calls `PS2_STUB()` (`src/pc/include/pc_prelude.h`), which prints the
function, file and line, then aborts.

- **The SDK.** `src/pc/sce/<library>.cpp` stubs every function declared in
  `include/sce`.
- **MWCC inline assembly.** Clang cannot compile MWCC's `asm {}` blocks, so a
  function containing one is compiled out of `src/common` under `DC_PC` and
  stubbed in `src/pc`. A static function becomes a declaration on PC, so its
  stub can live in another unit. Blocks that do nothing (the
  `bne $0, $0, done` in the `Align64` functions) are just compiled out. The asm
  constructor `CDataAlloc2<1>::CDataAlloc2()` only delegates, so
  `src/pc/dataalloc.cpp` gives the same thing in C++.
- **The hardware.** Functions that read or write PS2 registers or the
  scratchpad directly: `main`, `MGBeginFrame`, `MGEndFrame`,
  `VSyncCallBack_Load` and `CVisualShadow::CreateVUdataShadowCLIP`.
- **The Metrowerks runtime.** The C++ runtime and overlay loader at the top of
  `src/common/mathutil.cpp` are compiled out; only `mwInit`, the one entry
  point the game calls, is stubbed.

`src/pc/runtime.cpp` implements, rather than stubs, the runtime calls with a
host equivalent: `__assert` (in its Metrowerks argument order) and `exit__2`.

## Names the PS2 build renames

`main.cpp` calls other units through the names MWCC gives them
(`init_all__Fv`) and calls the overlays' entry points through their retail
addresses (`func_01DAC1C0`). `src/pc/main.cpp` forwards each one to the real
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

Edits that make `src/common` portable must leave both PS2 builds
byte-identical:

- **`DC_PC` guards.** These cover the asm functions, the runtime block and
  header-only overloads. The overloads accept a temporary `CRect_i_` or a
  string literal where MWCC bound them to a non-const parameter.
- **Initialisations a `switch` jumps over.** They are split into a declaration
  and an assignment.
- **Language linkage.** `BtEnemyLayoutList` and `BtUraEnemyLayoutList` are
  declared `extern "C"` to match their definitions.

Clang also needs a few flags to accept code MWCC accepts:

- `-fms-extensions`: pointers truncated to `int`.
- `-Wno-c++11-narrowing`: narrowing in braced initialisers.
- `-Wno-register`: the `register` keyword.
- `-Wno-return-mismatch`: a bare `return;` in a non-void function.

`STATIC_ASSERT` checks the PS2 layout, so it is off on PC. The executable is
linked without PIE so its code and data sit below 4 GiB. Pointers the game
casts to 32-bit integers therefore survive the round trip for globals, though
not for the heap or stack.
