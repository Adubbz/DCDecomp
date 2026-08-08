.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_957
/* 19DF08 0029DE08 6B676573 */ .word 0x7365676B
/* 19DF0C 0029DE0C 79616F00 */ .word GlobalDataBuffer + 0x44B0F9
