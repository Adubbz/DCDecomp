.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298A98
/* 198B98 00298A98 73717274 */ .word 0x74727173
/* 198B9C 00298A9C 00000000 */ .word 0x00000000
