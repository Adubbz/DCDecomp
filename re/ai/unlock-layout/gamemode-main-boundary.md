# `gamemode` suffix merge into `main`

## Scope

This boundary pass merges the former `gamemode` translation unit into the end
of `main`. It covers `MapJump` through `CheckTrialEnd` at
`0x00141D28..0x00143820`. The separate `dataread` tail described by the broader
P5 analysis remains deferred and is not part of this boundary.

## Source and layout findings

- `main.cpp` must declare `edit_map`, `sub_map`, and `event_no` before
  `MenuLoop`. The compiler emits `MenuLoop`'s `select` and guard statics next,
  followed by `mem_chk_mode`, `check_cancel`, `taiken_cnt`, and `taiken_start`.
  This reproduces retail's interleaved `main.sbss` run.
- The empty texture and menu table entries share the string emitted by
  `dataread` at retail symbol `@567`; `gamemode_empty_string` aliases that
  symbol until the deferred tail is merged.
- The compiler-generated cursor table lands in a dedicated sdata placement
  and is renamed to retail symbol `@905`. Its raw numbered name depends on the
  headers seen before the source body.
- `main.data`, `main.sdata`, and `main.sbss` retain their residual assembly
  around the compiled data. The linker script places the cursor table between
  the existing `dataread` sdata run and the remaining `main` sdata.

## Matching details

- `MemCheckLoop` has distinct case labels 2 and 3 even though their bodies are
  identical; retaining both labels reproduces the retail switch.
- `InitSave` assigns `read_buffer` while evaluating the first argument to
  `LoadFileMenuData`, preserving the retail argument evaluation order.
- The eleven source functions in this boundary are byte-perfect:
  `MapJump`, `MenuInit`, `MenuLoop`, `MemCheckInit`, `MemCheckLoop`, `InitSave`,
  `LoopSave`, `TrialEndInit`, `TrialEndLoop`, `TrialStart`, and `CheckTrialEnd`.

## Verification

A fresh split followed by a full `elf objdiff` build produced loaded
`SCUS_971.11`, `TITLE.BIN`, and `DUN.BIN` images identical to the immutable
wave baseline. Postflight reported zero regressions and increased main-image
byte-perfect functions from 1631 to 1642.
