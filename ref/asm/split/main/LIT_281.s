.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_281
/* 199E30 00299D30 62657261 */ .word 0x61726562
/* 199E34 00299D34 6E646100 */ .word GlobalDataBuffer + 0x36B3EE
