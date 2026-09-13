# `menu_misc` analysis

## Provenance

The bodies of the 18 functions matched here come from Dayuppy's Dark Cloud
decompilation. Each was restyled to this repository's headers and names and
judged against the reference assembly on its own.

## Accessors

Ten of the functions are single-load getters and single-store setters over
`.sbss` globals from `0x2A2DC8`, except `GetNowTestNo`, which reads
`MenuWeaponTestCase` from `.sdata` at `0x2A20D8`. Nothing writes that global, so
it keeps its initial 1. The global names are retail's; the comments state only
what the matched code does with them. `MenuItemUseVolume` is cleared and then
set by `ItemUseFunc` to a base value plus a `rand` remainder, which is all that
is established about it. `GetMenuHebikiriFlag` is `SaveData->GetGameFlag(0x30)`.

## Edit menu

`EditSwitch` holds the edit menu's state. `AnalyzeEdit` moves it to `0x12`,
`EdOptionSelect` and `EdMenuManualKey` back to 2. `EdMenuEffectFlag` selects the
icon movement: 1 runs `CalMoveFromMenuIcon`, 2 runs `CalMoveToMenuIcon`.
`EdOptionSelect` and `EdMenuManualKey` share one shape and differ only in the
page's input function and its exit test.

Two manual-menu return types were settled for `EdMenuManualKey`:

- `MenuManualKey` returns `$16`, which is 0 except on the path that calls
  `ExitManualMenu`, where it is 1.
- `GetNowManualMenuMode` loads a `short` with `lh` and returns it. The retail
  caller compares the full word without re-extending it, which an `s16` return
  type would emit, so it is declared `int`.

## Address-only differences

`ToAnalyzeEdit` and `AnalyzeEdit` reference `GamePad`, which links `0xC0` above
retail (`0x01CBC600` against `0x01CBC540`). The shift is inherited: `.bss` is
already `0x90` high before `.padbss` (`SinTable` links at `0x2AA0A0` against
`0x2AA010`), and the alignment at `pad_dma_buf`, the first `.padbss` symbol,
adds `0x30`. Both functions differ from retail only in the low half of that
address.
