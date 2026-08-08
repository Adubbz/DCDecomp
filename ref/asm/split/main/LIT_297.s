.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_297
/* 199EE8 00299DE8 726F7531 */ .word 0x31756F72
/* 199EEC 00299DEC 00000000 */ .word 0x00000000
