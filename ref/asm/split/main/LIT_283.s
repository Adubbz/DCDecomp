.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_283
/* 199E40 00299D40 68616775 */ .word 0x75676168
/* 199E44 00299D44 72756D61 */ .word 0x616D7572
/* 199E48 00299D48 202D6861 */ .word 0x61682D20
/* 199E4C 00299D4C 67757275 */ .word 0x75727567
/* 199E50 00299D50 6D613100 */ .word GlobalDataBuffer + 0x6B0ED
/* 199E54 00299D54 00000000 */ .word 0x00000000
