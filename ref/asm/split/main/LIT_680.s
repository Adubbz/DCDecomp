.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_680
/* 1994C0 002993C0 6D657377 */ .word 0x7773656D
/* 1994C4 002993C4 696E2F73 */ .word 0x732F6E69
/* 1994C8 002993C8 79737465 */ .word 0x65747379
/* 1994CC 002993CC 6D652E62 */ .word 0x622E656D
/* 1994D0 002993D0 696E0000 */ .word 0x00006E69
/* 1994D4 002993D4 00000000 */ .word 0x00000000
