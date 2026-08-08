.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_651
/* 19CB30 0029CA30 6D617365 */ .word 0x6573616D
/* 19CB34 0029CA34 6B696963 */ .word 0x6369696B
/* 19CB38 0029CA38 00000000 */ .word 0x00000000
/* 19CB3C 0029CA3C 00000000 */ .word 0x00000000
