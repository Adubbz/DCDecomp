.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_191
/* 1992A0 002991A0 4B000000 */ .word 0x0000004B
/* 1992A4 002991A4 00000000 */ .word 0x00000000
