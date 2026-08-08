.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_289__2
/* 199E88 00299D88 63617200 */ .word GlobalDataBuffer + 0x47B0E3
/* 199E8C 00299D8C 00000000 */ .word 0x00000000
