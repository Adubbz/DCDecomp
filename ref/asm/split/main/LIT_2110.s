.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2110
/* 19D370 0029D270 70353400 */ .word GlobalDataBuffer + 0x984F0
/* 19D374 0029D274 00000000 */ .word 0x00000000
