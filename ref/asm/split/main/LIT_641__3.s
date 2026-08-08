.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_641__3
/* 19E750 0029E650 636F6E66 */ .word 0x666E6F63
/* 19E754 0029E654 69672564 */ .word 0x64256769
/* 19E758 0029E658 203D2025 */ .word 0x25203D20
/* 19E75C 0029E65C 640A0000 */ .word 0x00000A64
