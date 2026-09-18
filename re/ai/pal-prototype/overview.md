# PAL prototype: functions absent from retail

The July 12, 2001 PAL prototype is not the build this repository matches. It boots
`SCUS_971.11` like NTSC 1.02, but its `SYSTEM.CNF` reads `VER = 0.01` and
`VMODE = PAL`, and the program's version string is `Dark Cloud Ver3.07 2001/07/12`
(NTSC 1.02: `Ver2.17 2001/05/11`). The disc image is 1,899,001,856 bytes, sha256
`c4b3b2d44a9eb401354541ee137d41ce0493cc4ba1c91f3d5b3b6754dfd95d05`.

Both programs keep their symbol tables and `.rel*` sections. The prototype names 4,082
functions and retail 4,067. Nineteen are prototype-only. Retail's own four
(`add_tree`, `copy_data_head`, `create_word_tree`, `search_tree`) are absent from the
prototype.

`m2c/` holds m2c's output for each of the nineteen, from `extract.py` with
`build/ctx.c` as context. None of it is matched or cleaned up, and nothing under `re/`
is built.

## Debug menu

`EditLoop` and `MainDraw` call `EdDebugMenu` while `debug_menu_mode` is nonzero, after
`KeyLock(&GamePad, 0)`. It keeps a page index in `mode` and moves it with the pad
bits 2 and 1, clamped to 0..2. Page 0 is `DM_Main`, page 1 `DM_Flag`, page 2
`DM_Sound`. The page is drawn through `DebugFont` after reloading texture slot 0x1F.

`DM_Main` lists nine rows, selected with pad bits 0x4000 and 0x1000 (wrapping), and
changed with 0x2000 and 0x8000:

| Row | Label | Effect |
|---|---|---|
| 0 | DEBUG CAMERA | `EdDebugCameraFlag` |
| 1 | PARAMETER | `EdDebugParamDrawOff`, inverted |
| 2 | CHARACTER | `EdDebugCharaDrawOff`, inverted |
| 3 | MESSAGE | `MesAbsDrawOff`, inverted |
| 4 | DEBUG MOVE | `EdDebugMoveFlag`, 0..2 |
| 5 | RUN EVENT | Event number (starts at 150, ±10 on bits 4 and 8); bit 0x20 writes it to `EdDebugRunEventNo`. |
| 6 | TALK EVENT | NPC number; bit 0x20 calls `EdTalkModeInit(&EdVillager, n)` and sets `EdDebugRunEventNo` to 0x100. |
| 7 | EVENT | `EdDebugEventEnable` |
| 8 | LANGUAGE | `LanguageCode`, 0..6 |

`EdDebugRunEventNo` is reset to -1 every frame before the row is handled.

`DM_Flag` shows and edits GAMEFLAG, MAPFLAG and COMPFLAG bits by index, TALKFLAG values,
game integer flag 0, the dungeon floor, the quest dungeon and the party count. The page
header is spelled `L2<-FALG   ->R`.

`DM_Sound` plays and stops BGM by number and sequence, plays sound effects and sound
sets, and toggles BGM through `SndBgmDisable`. `SndBgmPause` and
`SndGetBgmDisableFlag` are its prototype-only helpers.

`EdDPrintCamera` prints a `CCamera`'s position, reference point and projection;
`EdDPrintChara` prints a `CMainChara`'s position, rotation and three integers.

`ItemMenuMainKey` calls `InitDebugItemGet` on pad bit 0x100 after setting
`ItemMenuMode + 0x18` to 5. It writes 0x6A, 1 and 0 to the first three `ItemAutoGet`
fields and sets up a 0x100 by 0xE0 `MenuDbgMsg` box at (0x15E, 0x50) titled
`dbgwork_menu`.

`EdEventMode` calls `EdEventStopPlay` and `EdCheckEventPause`, 28 and 12 bytes.

## Retail remnants

NTSC 1.02 has none of the menu functions, but its symbol table still has
`debug_menu_mode`, `EdDDebug`, `EdDebugCameraFlag`, `EdDebugParamDrawOff`,
`EdDebugCharaDrawOff`, `EdDebugMoveFlag`, `EdDebugEventEnable`, `MesAbsDrawOff`,
`EdVillager`, `DebugFont`, `LanguageCode`, `ItemAutoGet` and `MenuDbgMsg`.

## PAL presentation

- `MGAdjustScreen(x, y)`, called from `main` and `MGInit`, stores each offset rounded
  down to even in `mgAdjustX` and `mgAdjustY`, and replaces any value outside -32..32
  with 0.
- `_GET_LANG_CODE` pushes `LanguageCode` onto the script stack. `_GET_TV_MODE` pushes
  a constant 1.
- `DrawEuroSpecialFont` draws up to 26 cells from the `euro` texture, two rows of 13,
  through `menu_euro_codetbl`, for `DrawNameTemplete`.
- `Get_NameTemp_PutX` returns an x offset from an 11-column `s16` table.
- `DrawOptionScreenWaku` draws the frame of the option screen.
- `StartMessageDraw` is 1,224 bytes.

## Not covered

Functions present in both programs differ as well: about 2,600 share a name but not a
size. Static names repeat across units, so that count is approximate.

The nineteen are m2c output only, with no typework.
