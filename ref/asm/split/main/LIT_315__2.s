.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_315__2
/* 19A2D8 0029A1D8 65626174 */ .word 0x74616265
/* 19A2DC 0029A1DC 32000000 */ .word 0x00000032
