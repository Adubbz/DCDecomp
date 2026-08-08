.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1631
/* 19BBD0 0029BAD0 3E3E0000 */ .word 0x00003E3E
/* 19BBD4 0029BAD4 00000000 */ .word 0x00000000
