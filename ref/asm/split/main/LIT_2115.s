.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2115
/* 19D398 0029D298 70333500 */ .word GlobalDataBuffer + 0xA82F0
/* 19D39C 0029D29C 00000000 */ .word 0x00000000
