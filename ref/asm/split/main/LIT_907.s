.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_907
/* 19A9F0 0029A8F0 72657630 */ .word 0x30766572
/* 19A9F4 0029A8F4 203D2025 */ .word 0x25203D20
/* 19A9F8 0029A8F8 73202564 */ .word 0x64252073
/* 19A9FC 0029A8FC 0A000000 */ .word 0x0000000A
