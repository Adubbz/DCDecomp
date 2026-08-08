.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2121__2
/* 19D3C8 0029D2C8 70343100 */ .word GlobalDataBuffer + 0x683F0
/* 19D3CC 0029D2CC 00000000 */ .word 0x00000000
