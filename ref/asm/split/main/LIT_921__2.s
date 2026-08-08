.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_921__2
/* 19BD00 0029BC00 25326400 */ .word GlobalDataBuffer + 0x3981A5
/* 19BD04 0029BC04 00000000 */ .word 0x00000000
/* 19BD08 0029BC08 00000000 */ .word 0x00000000
/* 19BD0C 0029BC0C 00000000 */ .word 0x00000000
