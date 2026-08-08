.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_731
/* 199088 00298F88 4B455900 */ .word GlobalDataBuffer + 0x2E94CB
/* 19908C 00298F8C 00000000 */ .word 0x00000000
