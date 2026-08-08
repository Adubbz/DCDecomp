.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297038
/* 197138 00297038 73656172 */ .word 0x72616573
/* 19713C 0029703C 6368206C */ .word 0x6C206863
/* 197140 00297040 6F63206C */ .word 0x6C20636F
/* 197144 00297044 626E2025 */ .word 0x25206E62
/* 197148 00297048 640A0000 */ .word 0x00000A64
/* 19714C 0029704C 00000000 */ .word 0x00000000
