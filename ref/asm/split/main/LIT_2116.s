.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2116
/* 19D3A0 0029D2A0 70333600 */ .word GlobalDataBuffer + 0xB82F0
/* 19D3A4 0029D2A4 00000000 */ .word 0x00000000
