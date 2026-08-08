.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_300__3
/* 19A570 0029A470 70353061 */ .word 0x61303570
/* 19A574 0029A474 00000000 */ .word 0x00000000
