# NPC action sequences

All 17 unit functions were analyzed through decompile.sh. ClearSeq establishes
an eight-entry circular action array at 0x11C0, with 0x50-byte stride. The
current and next writable indices are integers at 0x11B4 and 0x11B8;
sequence_enabled is at 0x11B0. The action opcode is at record+0, wait counter
at +4, destination vector at +0x10, and three float speeds at +0x20..+0x28.
SetSeq writes all three speeds, while PlaySeq consumes the first as horizontal
movement distance. Unconsumed record bytes remain unknown.

GetNowSeq/GetNextSeq return record pointers. SetSeq/SetWait return integer 1;
CheckSeq returns whether the read and write indices differ. The ring does not
check for overflow: after eight writes its indices become equal, so callers
must preserve the original queue discipline. NextSeq clears the current
record before testing whether advancing the read index is appropriate.

The gate at 0x146C enables drawing, stepping, and NPC collision queries.
`near_camera` at 0x1474 controls visibility/fade direction, and `unk_1488`
is a one-frame alpha-step override. Alpha itself is CCharacter ambient_offset[3]
at 0xCEC. The default alpha step is the integer at 0x1484, and the flag at
0x1478 requests stepping while hidden.

CNPCharacter currently embeds CCharacter instead of inheriting it. Its retail
constructor installs a derived vtable, requiring separate inheritance/layout
work before that constructor can be represented faithfully.

The movement/wait helpers, PlaySeq, Step, visibility/draw wrappers,
initialization, and both collision-query functions now match exactly.
CCharacter::PickUpPoly constructs two CCPoly triangles facing the query
position, using the existing collision.hpp definition; it returns two when
within the horizontal and vertical range and zero otherwise. No shared
header was changed. PlaySeq retains the retail transition that sets motion
0 at a completed destination and then sets motion 1 later in the same frame.
A separate interpolated-angle local preserves the original floating argument
register ordering. The 0.1f rotation rate is the retail word 0x3DCCCCCD at
0x2A1870 (_gp - 0x7F80).

Final retained work: 16 PERFECT functions, 2,652 ELF symbol bytes or 2,752
bytes including function-slot padding. The constructor remains in assembly
because its derived vtable cannot be emitted from the current composed class.

## Shared editor fields

The editor and NPC methods access the same state: `initialized` at 0x146C
gates the NPC methods, `draw_enabled` at 0x1470 selects editor participation,
and `near_camera` at 0x1474 requests full updates and fading toward visibility.
`step_hidden` at 0x1478 permits character stepping without that visibility
request. `map_parts_no` at 0x1440 and `resource_name[0x20]` at 0x1448 retain
the editor's model ownership information. NPC initialization clears only the
first resource-name byte, matching retail's byte store.

The editor's load routine sets offset 0x1484 to 8. NPC `Step` uses that integer
as the default per-frame alpha change, so the shared field is `alpha_step`.
The event NPC loop clears offset 0x11B0 to suspend queued playback; the shared
field is `sequence_enabled`. Both consumers use one definition without aliases
or layout changes; `sizeof(CNPCharacter)` remains 0x14A0.
