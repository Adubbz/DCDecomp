.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_282
/* 199E38 00299D38 6B757275 */ .word 0x7572756B
/* 199E3C 00299D3C 6D610000 */ .word 0x0000616D
