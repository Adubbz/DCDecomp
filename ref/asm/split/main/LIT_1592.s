.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1592
/* 19B480 0029B380 414D4249 */ .word 0x49424D41
/* 19B484 0029B384 454E5400 */ .word GlobalDataBuffer + 0x299DC5
