.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_755
/* 19C788 0029C688 696E7400 */ .word GlobalDataBuffer + 0x49BDE9
/* 19C78C 0029C68C 00000000 */ .word 0x00000000
