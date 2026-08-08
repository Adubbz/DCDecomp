.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel zero__3
/* 1984B4 002983B4 00000000 */ .word 0x00000000
