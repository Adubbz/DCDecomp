.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297018
/* 197118 00297018 73656172 */ .word 0x72616573
/* 19711C 0029701C 6368206E */ .word 0x6E206863
/* 197120 00297020 616D6520 */ .word 0x20656D61
/* 197124 00297024 25730A00 */ .word 0x000A7325
