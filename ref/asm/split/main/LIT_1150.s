.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1150
/* 19B650 0029B550 6974656D */ .word 0x6D657469
/* 19B654 0029B554 7061636B */ .word 0x6B636170
/* 19B658 0029B558 00000000 */ .word 0x00000000
/* 19B65C 0029B55C 00000000 */ .word 0x00000000
