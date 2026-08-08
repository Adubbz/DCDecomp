.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2118
/* 19D3B0 0029D2B0 70343900 */ .word GlobalDataBuffer + 0xE83F0
/* 19D3B4 0029D2B4 00000000 */ .word 0x00000000
