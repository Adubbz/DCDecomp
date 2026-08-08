.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1700
/* 19A2F8 0029A1F8 73616F00 */ .word GlobalDataBuffer + 0x44B0F3
/* 19A2FC 0029A1FC 00000000 */ .word 0x00000000
