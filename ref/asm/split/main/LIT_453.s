.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_453
/* 19F3A8 0029F2A8 73740000 */ .word 0x00007473
/* 19F3AC 0029F2AC 00000000 */ .word 0x00000000
