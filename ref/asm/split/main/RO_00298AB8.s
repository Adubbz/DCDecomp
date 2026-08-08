.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298AB8
/* 198BB8 00298AB8 73717274 */ .word 0x74727173
/* 198BBC 00298ABC 66000000 */ .word 0x00000066
