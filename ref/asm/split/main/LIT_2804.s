.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2804
/* 19AF78 0029AE78 6761696A */ .word 0x6A696167
/* 19AF7C 0029AE7C 692E696D */ .word 0x6D692E69
/* 19AF80 0029AE80 67000000 */ .word 0x00000067
/* 19AF84 0029AE84 00000000 */ .word 0x00000000
