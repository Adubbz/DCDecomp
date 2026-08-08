.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2363
/* 19AD58 0029AC58 65000000 */ .word 0x00000065
/* 19AD5C 0029AC5C 00000000 */ .word 0x00000000
