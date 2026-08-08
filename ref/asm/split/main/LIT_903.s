.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_903
/* 199628 00299528 20000000 */ .word 0x00000020
/* 19962C 0029952C 00000000 */ .word 0x00000000
