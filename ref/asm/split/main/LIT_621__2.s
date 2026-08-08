.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_621__2
/* 19A208 0029A108 736D6F6B */ .word 0x6B6F6D73
/* 19A20C 0029A10C 65000000 */ .word 0x00000065
