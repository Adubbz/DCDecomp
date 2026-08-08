.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1535
/* 19B9B0 0029B8B0 53455420 */ .word 0x20544553
/* 19B9B4 0029B8B4 4348524B */ .word 0x4B524843
/* 19B9B8 0029B8B8 45592020 */ .word 0x20205945
/* 19B9BC 0029B8BC 2020203D */ .word 0x3D202020
/* 19B9C0 0029B8C0 2025640A */ .word 0x0A642520
/* 19B9C4 0029B8C4 00000000 */ .word 0x00000000
