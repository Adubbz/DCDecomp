.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3004
/* 19B138 0029B038 63756265 */ .word 0x65627563
/* 19B13C 0029B03C 31000000 */ .word 0x00000031
