.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_908
/* 19AA00 0029A900 72657631 */ .word 0x31766572
/* 19AA04 0029A904 203D2025 */ .word 0x25203D20
/* 19AA08 0029A908 73202564 */ .word 0x64252073
/* 19AA0C 0029A90C 0A000000 */ .word 0x0000000A
