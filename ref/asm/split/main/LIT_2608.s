.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2608
/* 19B2F0 0029B1F0 63616D65 */ .word 0x656D6163
/* 19B2F4 0029B1F4 72610A00 */ .word 0x000A6172
