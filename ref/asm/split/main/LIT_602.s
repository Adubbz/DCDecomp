.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_602
/* 19C898 0029C798 61747370 */ .word 0x70737461
/* 19C89C 0029C79C 65656400 */ .word GlobalDataBuffer + 0x39B4E5
