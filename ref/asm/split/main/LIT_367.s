.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_367
/* 19A850 0029A750 50454F50 */ .word 0x504F4550
/* 19A854 0029A754 4C453200 */ .word GlobalDataBuffer + 0x794CC
