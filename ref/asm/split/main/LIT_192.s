.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_192
/* 1992A8 002991A8 57494E44 */ .word 0x444E4957
/* 1992AC 002991AC 45464645 */ .word 0x45464645
/* 1992B0 002991B0 43540000 */ .word 0x00005443
/* 1992B4 002991B4 00000000 */ .word 0x00000000
