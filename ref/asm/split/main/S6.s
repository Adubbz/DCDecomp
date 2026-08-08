.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel S6
/* 198998 00298898 7CD5CF5A */ .word 0x5ACFD57C
/* 19899C 0029889C 3AD9E53D */ .word 0x3DE5D93A
