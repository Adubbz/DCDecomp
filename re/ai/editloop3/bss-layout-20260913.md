# Editor event BSS placement

## Small BSS

The source emits 32 small-BSS objects in four residual retail runs: event-point
static values and guards at `0x2A29DC..0x2A29F5`, event flags at
`0x2A2A04..0x2A2A2C`, camera/load flags at `0x2A2A30..0x2A2A54`, and
conversation flags at `0x2A2A64..0x2A2A7C`. The event-point run requires a
four-byte end alignment before the existing fade flags. The retained
`0x2A2A54..0x2A2A64` dump supplies EdEventMode's two local values and guards.

Definitions of the file-scope event/camera flags are ordered as retail emits
them so each run can use one section. `simple_event` is GLOBAL in the retail
ELF, and retained editloop assembly references it; its source definition
therefore has external linkage. It is first declared in its owning source.
The four guard aliases reconcile raw-compiler names with mwccgap's retail
guard names; they apply to the existing objdiff build too.

All 32 objects were read back from xMAP and compared with the retail ELF:
address and size agree. No editloop3 small-BSS contribution remains in the
wildcard tail. `__bss_start=0x2A3709`, `SinTable=0x2AA010`,
`GamePad=0x1CBC540`, and `EdNPCBuffer=0x1D1B350` are restored.

Against immutable base b8ba7b90, the complete snapshot reports zero regressions.
Main PERFECT increases 1231 to 1548; TITLE 93 to 170; DUN 30 to 55. Main data
differences decrease 3436 to 6 bytes. Main object-exact functions without
a linked-perfect result decrease 368 to 51. These are placement restorations
of existing code, not new function implementations.

## Remaining BSS

The remaining 22 source objects occupy five runs: villager state at
`0x1D3B950..0x1D3D1C0`, event coordinate state at
`0x1D3EEA0..0x1D3EF90`, sequence/sprite pools at
`0x1D3F010..0x1D48FA4`, the event interpreter at
`0x1D4A430..0x1D4A478`, and file/light slots at
`0x1D4A4D0..0x1D4A630`. The pools and interpreter need their retail
16-byte trailing alignment before the following dump.

Their declarations are in retail emission order. The existing retained
constructor table and dropped `__sinit_editloop3.cpp` stay as before: this
change places storage and removes the duplicate residual dump allocations.
No source-owned editloop3 `.bss` or `.sbss` contribution remains in the tail.
All 54 objects across both commits match retail address and size.

Complete snapshot against b8ba7b90: main 1579 PERFECT, 10 fuzzy, 1320 asm,
46 unmatched, 6 differing data bytes; TITLE 170 PERFECT; DUN 55 PERFECT,
1 fuzzy, 1 asm, 4 unmatched. Zero function, data or objdiff regressions.
The object-exact/main-not-linked-perfect census is 368 to 20.
EdMapJump, AnalyzeEdit and ToAnalyzeEdit each judge PERFECT.

The later shared-header pass affected register allocation in the existing
partial EdDrawSky body. Retaining a named zero-valued second rotation argument
restored its prior score and improved it from 97.405045 to 97.4273. This is a
matching detail in an existing partial function, not an additional port or a
new PERFECT claim.
