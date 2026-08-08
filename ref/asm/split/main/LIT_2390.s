.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2390
/* 19AD78 0029AC78 25730000 */ .word 0x00007325
/* 19AD7C 0029AC7C 00000000 */ .word 0x00000000
