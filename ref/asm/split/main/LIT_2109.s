.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2109
/* 19D368 0029D268 70333900 */ .word GlobalDataBuffer + 0xE82F0
/* 19D36C 0029D26C 00000000 */ .word 0x00000000
