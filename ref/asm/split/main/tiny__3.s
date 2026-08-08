.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel tiny__3
/* 1984B0 002983B0 6042A20D */ .word 0x0DA24260
