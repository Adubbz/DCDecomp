.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298130
/* 198230 00298130 182D4454 */ .word 0x54442D18
/* 198234 00298134 FB21F9BF */ .word 0xBFF921FB
