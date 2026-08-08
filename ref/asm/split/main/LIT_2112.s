.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2112
/* 19D380 0029D280 63303300 */ .word GlobalDataBuffer + 0x87FE3
/* 19D384 0029D284 00000000 */ .word 0x00000000
