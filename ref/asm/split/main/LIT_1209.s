.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1209
/* 19E210 0029E110 31306200 */ .word GlobalDataBuffer + 0x377FB1
/* 19E214 0029E114 00000000 */ .word 0x00000000
