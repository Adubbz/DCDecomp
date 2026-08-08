.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_316__2
/* 19A5F0 0029A4F0 414D4249 */ .word 0x49424D41
/* 19A5F4 0029A4F4 454E5400 */ .word GlobalDataBuffer + 0x299DC5
