.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1010
/* 19D190 0029D090 5B25645D */ .word 0x5D64255B
/* 19D194 0029D094 626F6479 */ .word 0x79646F62
/* 19D198 0029D098 20636F6C */ .word 0x6C6F6320
/* 19D19C 0029D09C 202D3E20 */ .word 0x203E2D20
/* 19D1A0 0029D0A0 25730A00 */ .word 0x000A7325
/* 19D1A4 0029D0A4 00000000 */ .word 0x00000000
/* 19D1A8 0029D0A8 00000000 */ .word 0x00000000
/* 19D1AC 0029D0AC 00000000 */ .word 0x00000000
