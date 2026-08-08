.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298120
/* 198220 00298120 182D4454 */ .word 0x54442D18
/* 198224 00298124 FB2109C0 */ .word 0xC00921FB
