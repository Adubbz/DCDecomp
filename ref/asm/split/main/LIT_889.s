.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_889
/* 1995D0 002994D0 696E7465 */ .word 0x65746E69
/* 1995D4 002994D4 72696F72 */ .word 0x726F6972
/* 1995D8 002994D8 00000000 */ .word 0x00000000
/* 1995DC 002994DC 00000000 */ .word 0x00000000
