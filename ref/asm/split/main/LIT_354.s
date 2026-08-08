.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_354
/* 19A7A0 0029A6A0 454E5452 */ .word 0x52544E45
/* 19A7A4 0029A6A4 414E4345 */ .word 0x45434E41
/* 19A7A8 0029A6A8 00000000 */ .word 0x00000000
/* 19A7AC 0029A6AC 00000000 */ .word 0x00000000
