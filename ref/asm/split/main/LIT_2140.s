.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2140
/* 19D448 0029D348 70353561 */ .word 0x61353570
/* 19D44C 0029D34C 00000000 */ .word 0x00000000
