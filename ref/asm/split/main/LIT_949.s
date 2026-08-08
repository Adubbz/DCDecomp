.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_949
/* 19DEE0 0029DDE0 30360000 */ .word 0x00003630
/* 19DEE4 0029DDE4 00000000 */ .word 0x00000000
