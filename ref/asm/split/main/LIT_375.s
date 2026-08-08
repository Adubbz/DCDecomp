.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_375
/* 19A1A0 0029A0A0 6974656D */ .word 0x6D657469
/* 19A1A4 0029A0A4 5F6E6F3A */ .word 0x3A6F6E5F
/* 19A1A8 0029A0A8 20256420 */ .word 0x20642520
/* 19A1AC 0029A0AC 20697320 */ .word 0x20736920
/* 19A1B0 0029A0B0 4E554C4C */ .word 0x4C4C554E
/* 19A1B4 0029A0B4 0A000000 */ .word 0x0000000A
