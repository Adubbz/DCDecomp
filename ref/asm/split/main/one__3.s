.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel one__3
/* 198A18 00298918 0000803F */ .word 0x3F800000
