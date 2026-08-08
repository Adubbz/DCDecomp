.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1110
/* 19E110 0029E010 57656170 */ .word 0x70616557
/* 19E114 0029E014 6F6E4275 */ .word 0x75426E6F
/* 19E118 0029E018 66666572 */ .word 0x72656666
/* 19E11C 0029E01C 20616464 */ .word 0x64646120
/* 19E120 0029E020 72657373 */ .word 0x73736572
/* 19E124 0029E024 20203D20 */ .word 0x203D2020
/* 19E128 0029E028 25700A00 */ .word 0x000A7025
/* 19E12C 0029E02C 00000000 */ .word 0x00000000
