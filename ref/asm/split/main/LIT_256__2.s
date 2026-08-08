.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_256__2
/* 199D40 00299C40 62657373 */ .word 0x73736562
/* 199D44 00299C44 69747520 */ .word 0x20757469
/* 199D48 00299C48 2D653031 */ .word 0x3130652D
/* 199D4C 00299C4C 6830325F */ .word 0x5F323068
/* 199D50 00299C50 63000000 */ .word 0x00000063
/* 199D54 00299C54 00000000 */ .word 0x00000000
