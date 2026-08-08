.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2362
/* 19AD50 0029AC50 6D000000 */ .word 0x0000006D
/* 19AD54 0029AC54 00000000 */ .word 0x00000000
