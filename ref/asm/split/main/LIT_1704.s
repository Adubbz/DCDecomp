.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1704
/* 19A320 0029A220 74757269 */ .word 0x69727574
/* 19A324 0029A224 62617269 */ .word 0x69726162
/* 19A328 0029A228 00000000 */ .word 0x00000000
/* 19A32C 0029A22C 00000000 */ .word 0x00000000
