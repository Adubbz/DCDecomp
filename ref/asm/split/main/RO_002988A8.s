.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002988A8
/* 1989A8 002988A8 EB9C2B8A */ .word 0x8A2B9CEB
/* 1989AC 002988AC E6E55ABE */ .word 0xBE5AE5E6
