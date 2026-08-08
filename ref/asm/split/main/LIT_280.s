.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_280
/* 199E28 00299D28 6E696B61 */ .word 0x616B696E
/* 199E2C 00299D2C 69000000 */ .word 0x00000069
