.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2753
/* 19AF08 0029AE08 735F6566 */ .word 0x66655F73
/* 19AF0C 0029AE0C 662E696D */ .word 0x6D692E66
/* 19AF10 0029AE10 67000000 */ .word 0x00000067
/* 19AF14 0029AE14 00000000 */ .word 0x00000000
