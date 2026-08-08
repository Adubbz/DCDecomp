.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1211
/* 19B630 0029B530 63303577 */ .word 0x77353063
/* 19B634 0029B534 5F680000 */ .word 0x0000685F
