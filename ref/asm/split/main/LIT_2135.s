.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2135
/* 19D420 0029D320 70333261 */ .word 0x61323370
/* 19D424 0029D324 00000000 */ .word 0x00000000
