.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_730__2
/* 19AB28 0029AA28 74616C6B */ .word 0x6B6C6174
/* 19AB2C 0029AA2C 00000000 */ .word 0x00000000
