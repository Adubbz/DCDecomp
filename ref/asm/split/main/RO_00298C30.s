.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298C30
/* 198D30 00298C30 53544142 */ .word 0x42415453
/* 198D34 00298C34 4C450000 */ .word 0x0000454C
