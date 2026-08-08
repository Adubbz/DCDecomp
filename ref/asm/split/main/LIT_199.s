.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_199
/* 198E88 00298D88 25642F25 */ .word 0x252F6425
/* 198E8C 00298D8C 640A0000 */ .word 0x00000A64
