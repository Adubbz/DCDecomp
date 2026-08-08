.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2117
/* 19D3A8 0029D2A8 70333700 */ .word GlobalDataBuffer + 0xC82F0
/* 19D3AC 0029D2AC 00000000 */ .word 0x00000000
