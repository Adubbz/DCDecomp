.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2107
/* 19D358 0029D258 70313300 */ .word GlobalDataBuffer + 0x880F0
/* 19D35C 0029D25C 00000000 */ .word 0x00000000
