.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1207
/* 19B528 0029B428 6B617761 */ .word 0x6177616B
/* 19B52C 0029B42C 00000000 */ .word 0x00000000
