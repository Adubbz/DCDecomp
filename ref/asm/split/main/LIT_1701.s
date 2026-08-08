.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1701
/* 19A300 0029A200 756B6900 */ .word GlobalDataBuffer + 0x3EBAF5
/* 19A304 0029A204 00000000 */ .word 0x00000000
