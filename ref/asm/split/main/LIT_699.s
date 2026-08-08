.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_699
/* 19CDA8 0029CCA8 6B657968 */ .word 0x6879656B
/* 19CDAC 0029CCAC 6F6E6500 */ .word GlobalDataBuffer + 0x3ABDEF
