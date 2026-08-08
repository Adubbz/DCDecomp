.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1424
/* 19B1F8 0029B0F8 25642025 */ .word 0x25206425
/* 19B1FC 0029B0FC 640A0000 */ .word 0x00000A64
