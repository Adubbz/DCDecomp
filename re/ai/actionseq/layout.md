# Action sequence records

Analysis uses all 26 retail functions through `decompile.sh`, with instruction
inspection for field widths and return values. `GetNextSeq` walks `capacity`
records with stride 0x20 from offset 0xC8, testing the operation at record +0
and clearing the next link at +0xC. `NextMoveSeq`, `NextMotionSeq`, and
`NextAnimeSeq` append that returned pointer to independent head/tail pairs
at 0x00/0x04, 0xB4/0xB8, and 0xBC/0xC0. These four functions return ACT_SEQ*,
not void. `DeleteSeq` saves the next link, clears operation and link, and
returns the saved pointer. The pool size is at 0xC4 and character at 0xCC.

The operation payload occupies +0x10..+0x1F. Movement and rotation use four
floats; motion stores integer ID/mode, float speed, and integer flags;
texture animation stores integer ID/enable/disable-after. The integer +4
is a duration for movement/animation or delay for triggers. Record +8 is
unresolved. `Play` consumes these same union views according to the tag.

The 0xD0 sequencer contains position vectors at 0x10, 0x20, and 0x30;
rotation vectors at 0x70, 0x90, and 0xA0; an additional rotation queue at
0x80/0x84. Frame counters and trigger state are cleared by `ClearSeq` in
retail store order. No external shared layout is changed here.

`SyncChara` calls CCharacter::GetPosition through vtable +0xA0 and
CObject::GetRotation(float*) through +0x58, as confirmed by the retail
CCharacter vtable at 0x2A12B0. The existing headers already encode these
virtuals correctly. Position then rotation local-vector declaration order
matches their retail stack slots 0x30 and 0x40.

All 25 non-Play functions are now individually PERFECT (objdiff 100 and no
linked instruction differences), totaling 2,256 ELF symbol bytes (2,416 bytes including slot padding). Pool
search, initialization, all three queue append operations, and the static
DeleteSeq helper are included. readelf marks DeleteSeq FUNC LOCAL, size 40;
its implementation therefore stays file-static. MoveSeq(float*,float) uses
a double zero in its positive fractional-remainder comparison, preserving
retail's double conversion/comparison helper calls. CheckEnd's motion mode
7 and MotionSeq's flag mask 4 remain numeric because their broader enum
semantics have not been established.

Play remains in assembly. The final wide-filter sweep attempts that one
remaining function and reports BUILDFAIL. Its 2,820 ELF symbol bytes (2,832 with slot padding) use
rotation interpolation, motion completion, texture animation, virtual
transform setters, and a local zero-vector initializer. The m2c draft still
confuses CCharacter members and cannot be retained as written. No external
header or data-layout change is requested without further analysis.
