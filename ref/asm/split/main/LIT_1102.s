.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1102
/* 19F588 0029F488 775F7265 */ .word 0x65725F77
/* 19F58C 0029F48C 636F7665 */ .word 0x65766F63
/* 19F590 0029F490 72000000 */ .word 0x00000072
/* 19F594 0029F494 00000000 */ .word 0x00000000
