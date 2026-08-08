.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1552
/* 19BA08 0029B908 43555253 */ .word 0x53525543
/* 19BA0C 0029B90C 45000000 */ .word 0x00000045
