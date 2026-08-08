.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_332__4
/* 19A688 0029A588 53554E00 */ .word GlobalDataBuffer + 0x23A4D3
/* 19A68C 0029A58C 00000000 */ .word 0x00000000
