.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_853
/* 19B1F0 0029B0F0 25730A00 */ .word 0x000A7325
/* 19B1F4 0029B0F4 00000000 */ .word 0x00000000
