.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1702
/* 19A308 0029A208 68617269 */ .word 0x69726168
/* 19A30C 0029A20C 00000000 */ .word 0x00000000
