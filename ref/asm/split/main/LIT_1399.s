.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1399
/* 19B448 0029B348 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19B44C 0029B34C 00000000 */ .word 0x00000000
