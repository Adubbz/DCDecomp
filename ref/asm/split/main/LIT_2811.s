.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2811
/* 19B000 0029AF00 70617573 */ .word 0x73756170
/* 19B004 0029AF04 652E696D */ .word 0x6D692E65
/* 19B008 0029AF08 67000000 */ .word 0x00000067
/* 19B00C 0029AF0C 00000000 */ .word 0x00000000
