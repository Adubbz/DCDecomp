.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel one__2
/* 198950 00298850 00000000 */ .word 0x00000000
/* 198954 00298854 0000F03F */ .word 0x3FF00000
