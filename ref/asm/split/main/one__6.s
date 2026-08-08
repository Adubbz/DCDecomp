.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel one__6
/* 198B84 00298A84 0000803F */ .word 0x3F800000
