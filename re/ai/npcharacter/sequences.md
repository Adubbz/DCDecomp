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
Existing unk_1474 controls visibility/fade direction and existing unk_1488
is a one-frame alpha-step override; external editloop callers reference these
names, so their names are retained. Alpha itself is CCharacter ambient_offset[3]
at 0xCEC. The default alpha step is the integer at 0x1484, and the flag at
0x1478 requests stepping while hidden.

CNPCharacter currently embeds CCharacter instead of inheriting it. Its retail
constructor installs a derived vtable, requiring separate inheritance/layout
work before that constructor can be represented faithfully.
