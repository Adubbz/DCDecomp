.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_724__2
/* 19CEF8 0029CDF8 6B616972 */ .word 0x7269616B
/* 19CEFC 0029CDFC 696E6700 */ .word GlobalDataBuffer + 0x3CBDE9
