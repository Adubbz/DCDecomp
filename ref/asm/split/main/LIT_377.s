.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_377
/* 19A8C0 0029A7C0 74657374 */ .word 0x74736574
/* 19A8C4 0029A7C4 00000000 */ .word 0x00000000
