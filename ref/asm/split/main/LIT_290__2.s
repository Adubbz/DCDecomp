.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_290__2
/* 199E90 00299D90 72616E70 */ .word 0x706E6172
/* 199E94 00299D94 75000000 */ .word 0x00000075
