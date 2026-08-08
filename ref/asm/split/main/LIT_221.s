.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_221
/* 198F98 00298E98 776F726B */ .word 0x6B726F77
/* 198F9C 00298E9C 00000000 */ .word 0x00000000
