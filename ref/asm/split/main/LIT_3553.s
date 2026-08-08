.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3553
/* 19EEE0 0029EDE0 6576656E */ .word 0x6E657665
/* 19EEE4 0029EDE4 74757365 */ .word 0x65737574
/* 19EEE8 0029EDE8 2E62696E */ .word 0x6E69622E
/* 19EEEC 0029EDEC 00000000 */ .word 0x00000000
