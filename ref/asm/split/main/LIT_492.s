.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_492
/* 19C110 0029C010 414D4249 */ .word 0x49424D41
/* 19C114 0029C014 454E5400 */ .word GlobalDataBuffer + 0x299DC5
