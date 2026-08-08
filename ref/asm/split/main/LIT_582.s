.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_582
/* 19A398 0029A298 696E617A */ .word 0x7A616E69
/* 19A39C 0029A29C 756D6100 */ .word GlobalDataBuffer + 0x36BCF5
