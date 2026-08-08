.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel one__5
/* 198B08 00298A08 00000000 */ .word 0x00000000
/* 198B0C 00298A0C 0000F03F */ .word 0x3FF00000
