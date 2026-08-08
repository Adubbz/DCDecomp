.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2120__2
/* 19D3C0 0029D2C0 70373500 */ .word GlobalDataBuffer + 0xA86F0
/* 19D3C4 0029D2C4 00000000 */ .word 0x00000000
