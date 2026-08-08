.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_303__2
/* 19A588 0029A488 70353361 */ .word 0x61333570
/* 19A58C 0029A48C 00000000 */ .word 0x00000000
