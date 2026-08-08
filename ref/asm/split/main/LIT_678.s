.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_678
/* 1994A0 002993A0 6D657377 */ .word 0x7773656D
/* 1994A4 002993A4 696E2F73 */ .word 0x732F6E69
/* 1994A8 002993A8 79737465 */ .word 0x65747379
/* 1994AC 002993AC 6D5F2564 */ .word 0x64255F6D
/* 1994B0 002993B0 00000000 */ .word 0x00000000
/* 1994B4 002993B4 00000000 */ .word 0x00000000
