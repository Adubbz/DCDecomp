.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2122__2
/* 19D3D0 0029D2D0 70333800 */ .word GlobalDataBuffer + 0xD82F0
/* 19D3D4 0029D2D4 00000000 */ .word 0x00000000
