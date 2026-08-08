.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2108
/* 19D360 0029D260 70333100 */ .word GlobalDataBuffer + 0x682F0
/* 19D364 0029D264 00000000 */ .word 0x00000000
