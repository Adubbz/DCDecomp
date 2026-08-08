.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_673
/* 19CC70 0029CB70 74757269 */ .word 0x69727574
/* 19CC74 0029CB74 73616F00 */ .word GlobalDataBuffer + 0x44B0F3
