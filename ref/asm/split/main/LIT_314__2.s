.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_314__2
/* 19A2D0 0029A1D0 65626174 */ .word 0x74616265
/* 19A2D4 0029A1D4 00000000 */ .word 0x00000000
