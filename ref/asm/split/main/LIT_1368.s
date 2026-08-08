.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1368
/* 19B7A0 0029B6A0 546F7461 */ .word 0x61746F54
/* 19B7A4 0029B6A4 6C4D656D */ .word 0x6D654D6C
/* 19B7A8 0029B6A8 203D2025 */ .word 0x25203D20
/* 19B7AC 0029B6AC 640A0000 */ .word 0x00000A64
