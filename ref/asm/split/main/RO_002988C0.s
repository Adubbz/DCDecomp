.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002988C0
/* 1989C0 002988C0 A6F81011 */ .word 0x1110F8A6
/* 1989C4 002988C4 1111813F */ .word 0x3F811111
