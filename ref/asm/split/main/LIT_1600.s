.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1600
/* 19B4D0 0029B3D0 46495245 */ .word 0x45524946
/* 19B4D4 0029B3D4 00000000 */ .word 0x00000000
