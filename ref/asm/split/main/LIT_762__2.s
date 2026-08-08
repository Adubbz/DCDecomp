.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_762__2
/* 19EF80 0029EE80 64756E65 */ .word 0x656E7564
/* 19EF84 0029EE84 6E746572 */ .word 0x7265746E
/* 19EF88 0029EE88 2F64756E */ .word 0x6E75642F
/* 19EF8C 0029EE8C 656E7465 */ .word 0x65746E65
/* 19EF90 0029EE90 7225642E */ .word 0x2E642572
/* 19EF94 0029EE94 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
