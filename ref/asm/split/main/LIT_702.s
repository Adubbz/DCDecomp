.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_702
/* 19CDC8 0029CCC8 6B657969 */ .word 0x6979656B
/* 19CDCC 0029CCCC 73686900 */ .word GlobalDataBuffer + 0x3EB7F3
