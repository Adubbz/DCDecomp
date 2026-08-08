.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_885
/* 19A9E8 0029A8E8 4D415800 */ .word GlobalDataBuffer + 0x2D90CD
/* 19A9EC 0029A8EC 00000000 */ .word 0x00000000
