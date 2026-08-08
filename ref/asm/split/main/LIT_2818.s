.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2818
/* 19B068 0029AF68 735F6566 */ .word 0x66655F73
/* 19B06C 0029AF6C 30310000 */ .word 0x00003130
