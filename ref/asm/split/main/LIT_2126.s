.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2126
/* 19D3D8 0029D2D8 612E7061 */ .word 0x61702E61
/* 19D3DC 0029D2DC 63000000 */ .word 0x00000063
