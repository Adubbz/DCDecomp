.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_586__2
/* 19E528 0029E428 70657262 */ .word 0x62726570
/* 19E52C 0029E42C 72640000 */ .word 0x00006472
