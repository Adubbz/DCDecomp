.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_355
/* 19A7B0 0029A6B0 4D41504A */ .word 0x4A50414D
/* 19A7B4 0029A6B4 554D5000 */ .word GlobalDataBuffer + 0x259CD5
