.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2111
/* 19D378 0029D278 70373400 */ .word GlobalDataBuffer + 0x986F0
/* 19D37C 0029D27C 00000000 */ .word 0x00000000
