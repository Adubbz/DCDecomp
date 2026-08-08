.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_472
/* 199978 00299878 71000000 */ .word 0x00000071
/* 19997C 0029987C 00000000 */ .word 0x00000000
