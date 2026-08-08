.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_587
/* 19C5A0 0029C4A0 64756E2F */ .word 0x2F6E7564
/* 19C5A4 0029C4A4 6D61696E */ .word 0x6E69616D
/* 19C5A8 0029C4A8 63686172 */ .word 0x72616863
/* 19C5AC 0029C4AC 612F6330 */ .word 0x30632F61
/* 19C5B0 0029C4B0 36622E63 */ .word 0x632E6236
/* 19C5B4 0029C4B4 68720000 */ .word 0x00007268
/* 19C5B8 0029C4B8 00000000 */ .word 0x00000000
/* 19C5BC 0029C4BC 00000000 */ .word 0x00000000
