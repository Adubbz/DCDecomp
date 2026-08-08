.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2044
/* 19F170 0029F070 4974656D */ .word 0x6D657449
/* 19F174 0029F074 4E6F2020 */ .word 0x20206F4E
/* 19F178 0029F078 203A2564 */ .word 0x64253A20
/* 19F17C 0029F07C 0A000000 */ .word 0x0000000A
