.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_844
/* 19F020 0029EF20 64756E65 */ .word 0x656E7564
/* 19F024 0029EF24 6E746572 */ .word 0x7265746E
/* 19F028 0029EF28 00000000 */ .word 0x00000000
/* 19F02C 0029EF2C 00000000 */ .word 0x00000000
