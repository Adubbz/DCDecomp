.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2120
/* 19B560 0029B460 73657475 */ .word 0x75746573
/* 19B564 0029B464 7A6F6B75 */ .word 0x756B6F7A
/* 19B568 0029B468 00000000 */ .word 0x00000000
/* 19B56C 0029B46C 00000000 */ .word 0x00000000
