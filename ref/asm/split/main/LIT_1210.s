.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1210
/* 19E218 0029E118 31386100 */ .word GlobalDataBuffer + 0x3687B1
/* 19E21C 0029E11C 00000000 */ .word 0x00000000
