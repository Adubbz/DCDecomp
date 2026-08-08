.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_948
/* 19DED8 0029DDD8 30340000 */ .word 0x00003430
/* 19DEDC 0029DDDC 00000000 */ .word 0x00000000
