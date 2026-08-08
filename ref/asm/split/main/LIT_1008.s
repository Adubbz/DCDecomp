.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1008
/* 19BF10 0029BE10 2A2A2A2A */ .word 0x2A2A2A2A
/* 19BF14 0029BE14 2A2A2A20 */ .word 0x202A2A2A
/* 19BF18 0029BE18 4E504345 */ .word 0x4543504E
/* 19BF1C 0029BE1C 6E747279 */ .word 0x7972746E
/* 19BF20 0029BE20 4572720A */ .word 0x0A727245
/* 19BF24 0029BE24 00000000 */ .word 0x00000000
