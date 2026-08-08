.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_490
/* 19C100 0029C000 47524400 */ .word GlobalDataBuffer + 0x19A1C7
/* 19C104 0029C004 00000000 */ .word 0x00000000
