.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel S2
/* 198978 00298878 A6F81011 */ .word 0x1110F8A6
/* 19897C 0029887C 1111813F */ .word 0x3F811111
