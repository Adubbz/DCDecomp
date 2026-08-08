.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_291
/* 199E98 00299D98 6869796F */ .word 0x6F796968
/* 199E9C 00299D9C 6B650000 */ .word 0x0000656B
