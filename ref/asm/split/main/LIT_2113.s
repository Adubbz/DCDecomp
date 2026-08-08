.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2113
/* 19D388 0029D288 70303200 */ .word GlobalDataBuffer + 0x77FF0
/* 19D38C 0029D28C 00000000 */ .word 0x00000000
