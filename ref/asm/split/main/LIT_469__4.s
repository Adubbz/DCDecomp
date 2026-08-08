.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_469__4
/* 19B3B8 0029B2B8 62756666 */ .word 0x66667562
/* 19B3BC 0029B2BC 65722025 */ .word 0x25207265
/* 19B3C0 0029B2C0 640A0000 */ .word 0x00000A64
/* 19B3C4 0029B2C4 00000000 */ .word 0x00000000
