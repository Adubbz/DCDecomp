.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_467__2
/* 199950 00299850 2E686400 */ .word GlobalDataBuffer + 0x39B7AE
/* 199954 00299854 00000000 */ .word 0x00000000
