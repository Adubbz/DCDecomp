.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_417
/* 198F78 00298E78 61627566 */ .word 0x66756261
/* 198F7C 00298E7C 66203D20 */ .word 0x203D2066
/* 198F80 00298E80 25640A00 */ .word 0x000A6425
/* 198F84 00298E84 00000000 */ .word 0x00000000
