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

`SyncChara` and `Play` require careful CCharacter virtual interface analysis:
the current decompiler mistakes vtable accesses for texture-animation fields.
They must not be translated using those inferred expressions.
