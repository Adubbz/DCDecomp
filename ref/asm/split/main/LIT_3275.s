.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3275
/* 19D588 0029D488 66707265 */ .word 0x65727066
/* 19D58C 0029D48C 63627264 */ .word 0x64726263
/* 19D590 0029D490 00000000 */ .word 0x00000000
/* 19D594 0029D494 00000000 */ .word 0x00000000
/* 19D598 0029D498 00000000 */ .word 0x00000000
/* 19D59C 0029D49C 00000000 */ .word 0x00000000
