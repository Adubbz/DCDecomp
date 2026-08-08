.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298C38
/* 198D38 00298C38 45584543 */ .word 0x43455845
/* 198D3C 00298C3C 434D4400 */ .word GlobalDataBuffer + 0x199CC3
