.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1546
/* 19B9E0 0029B8E0 53554200 */ .word GlobalDataBuffer + 0x17A4D3
/* 19B9E4 0029B8E4 00000000 */ .word 0x00000000
