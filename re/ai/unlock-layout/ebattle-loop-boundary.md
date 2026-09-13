# `ebattle_loop` merge into `ebattle`

## Scope

This boundary pass removes the split at `0x00168200` and merges the former
`ebattle_loop` translation unit through `0x0016D858` into `ebattle`. The earlier
`textureanime -> ebattle` boundary at `0x00167C80` remains unchanged; this does
not implement that separate part of the broader P11 proposal.

## Boundary evidence

- `EBInit` in the existing `ebattle` prefix calls `init_draw_ok` in the former
  `ebattle_loop` suffix.
- The prefix and suffix share the enemy-battle motion array, timing values,
  state counters, texture pointers, sound flags, and debug mode.
- The merged text has one uninterrupted address-ordered function run from
  `CommandTEX_ANIME` through `EdInitGotoInterior` in `ebattle.cpp.o`.

## Section placement

- The merged `ebattle` rodata run is `0x0029A1C0..0x0029A268`. It contains
  `Caution`, the shared `"ebat"` and `"ebat2"` strings, the six former
  `ebattle_loop` constants `@1686` and `@1700..@1704`, and `@1721` carried by
  `EdMoveChara`'s reference assembly.
- The local `key_mode` word remains at retail address `0x002A1F14`; the linker
  script now places `ebattle.cpp.o (.sdata)` in that slot.
- The split and linker script no longer create or place an
  `ebattle_loop.cpp.o` object.
- `init_draw_ok`, `set_draw_ok`, `check_key_mode`, and `keylock` are local
  functions in the retail symbol table. Merging the source restores the first
  three to `static`; the old split had required public linkage for calls that
  crossed its artificial translation-unit boundary.

## Verification

All 31 compiled functions in the merged object report `PERFECT` through
`check.sh`. A fresh split and full `elf objdiff` build produced loaded
`SCUS_971.11`, `TITLE.BIN`, and `DUN.BIN` images identical to the immutable wave
baseline. The four local helpers remain `FUNC LOCAL` in the rebuilt object.
Postflight reported zero regressions.
