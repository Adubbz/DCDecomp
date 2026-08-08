.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1606
/* 19B510 0029B410 57415445 */ .word 0x45544157
/* 19B514 0029B414 525F5348 */ .word 0x48535F52
/* 19B518 0029B418 414B4500 */ .word GlobalDataBuffer + 0x1A9AC1
/* 19B51C 0029B41C 00000000 */ .word 0x00000000
