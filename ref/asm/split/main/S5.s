.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel S5
/* 198990 00298890 EB9C2B8A */ .word 0x8A2B9CEB
/* 198994 00298894 E6E55ABE */ .word 0xBE5AE5E6
