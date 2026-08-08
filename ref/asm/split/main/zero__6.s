.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel zero__6
/* 198A14 00298914 00000000 */ .word 0x00000000
