.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1555
/* 19BA18 0029B918 48554D41 */ .word 0x414D5548
/* 19BA1C 0029B91C 4E202020 */ .word 0x2020204E
/* 19BA20 0029B920 00000000 */ .word 0x00000000
/* 19BA24 0029B924 00000000 */ .word 0x00000000
