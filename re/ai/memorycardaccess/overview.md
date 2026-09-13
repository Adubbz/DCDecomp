# `memorycardaccess` analysis

## Translation unit

The retail unit begins at `0x2135D0`. Its 28 functions and associated constants
are split from the `memorycardaccess` segment. Building the segment as C++ makes
each function independently replaceable through its `INCLUDE_ASM` marker.

The conversion does not fix the inherited constant placement. The unit's
constants currently link `0xC0` above their retail addresses. As a result, 59
references emitted by the per-function reference objects contain retail's low
half and point `0xC0` below the linked constants. This is also how existing C++
units with duplicated numbered constants behave. It remains a layout issue,
not evidence that the constants have migrated to C++.

## `CMemoryCardAccess`

The class has size `0x7C0`. The member offsets come from the loads and stores
across the unit, with the following useful producers and consumers:

- `Initialize` clears the error fields, assigns the version and names, sets
  `func_no` to the idle operation, sets `fd` to `-1`, points `file_info` at the
  file table, and clears the icon and card records.
- `SetBuff` establishes `save_buffer`, `check_sum`, and `read_buffer` within the
  caller-provided save image.
- `SearchMcType` fills the two `MC_CARD_INFO` records from `sceMcGetInfo` and
  `sceMcSync`.
- `GetDir` fills `dir_table`; `CheckFileNo` and the save/load operations consume
  it.
- `SetIconData` copies three `MC_ICON_FILE` descriptors into `icon`. It copies
  the filename, data pointer and size records, not the pointed-to file data.
- `MakeDir` writes the descriptor data to the three icon files. Its
  `MakeMcIconSysInfo` call prepares the browser metadata in `icon_sys`.
- `GetSaveFileInfoFromMc` fills one `SAVEDATA_INFO`; the menu consumes that
  table through `DrawSaveBoard`.

`MC_ICON_FILE::data` and `MC_ICON_FILE::size` are read by `MakeDir`, which is
still assembly-backed. Their offsets and uses are established, but no matched
reader currently provides the stricter naming evidence requested by the local
commit checklist.

`SAVEDATA_INFO::name` remains unresolved. The save-data interface supplies a
`char *`, while `DrawSaveBoardCharaName2` receives a `short *`. The field stays
a 0x20-byte character array because that is the storage used by the current
producer, but the character width disagreement needs analysis before either
interface is treated as settled.

`unk_30`, `unk_D8`, `unk_E0`, and the four bytes after `func_no` remain unknown.
The value `0x3D` is written to `unk_E0` by both `Initialize` and `SetFuncNo`
when the idle operation is selected. No reader of that field was found in this
unit or through a direct `McAccess + 0xE0` reference, so neither the field nor
the value is given a speculative name.

## Operation dispatch

`Step` uses `func_no` as a jump-table index. The targets establish these
operations directly:

| Value | Target |
| ---: | --- |
| 0 | `SearchMcType` |
| 1 | idle / no call |
| 2 | `GetDir` |
| 3 | `MakeDir` |
| 4 | `GetAllSaveFileInfo` |
| 5 | `SaveToMc` |
| 6 | `LoadFromMc` |
| 8 | `FormatForMc` |
| 9 | `McUnFormatForDebug` |
| 11 | `Write` |
| 12 | `LoadSysConfig` |
| 13 | `SaveSysConfig` |
| 14 | `Convert` |

Values 7, 10 and 15 also reach the idle target, but no caller assigning those
values was found, so they have no enum names. After an operation returns `1`,
`Step` clears the step state and calls `SetFuncNo(MC_OPERATION_IDLE)`.

`sceMcSync` mode `1` polls without waiting. The SDK convention names modes 0
and 1 `MC_WAIT` and `MC_NOWAIT`; `SetFuncNo` uses `MC_NOWAIT` to consume any
completed command state before the next operation begins.

## Matched functions

- `GetFuncNo` returns the operation field at offset `0xBC`.
- `GetVersion` returns the version buffer at offset `0x1C`.
- `SetVersion` copies the supplied string into that buffer with `strcpy`.
- `SetFuncNo` stores the operation, resets `step`, restores `unk_E0` to `0x3D`
  for the idle operation, and polls the memory-card library once.
- `SetIconData` copies the three 12-byte icon descriptors individually.

Each of these five definitions scores 100% in objdiff and is byte-perfect in
the linked image. `SetFuncNo` is `void`: it deliberately does not compute a
result after calling `sceMcSync`, and no caller consumes a return value.

## Return types

Return declarations were checked using control flow and callers rather than a
register-at-return shortcut. The operation functions return status values that
`Step` consumes; accessors return their corresponding field addresses or
values; setters whose callers consume no value and which compute no result are
`void`. The four expanded size tags (`Step`, `MakeDir`, `SaveToMc`, and
`GetMsgNo`) cover their complete readelf symbol ranges, including jump-table
tails.
