.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_286__3
/* 19A500 0029A400 70333561 */ .word 0x61353370
/* 19A504 0029A404 00000000 */ .word 0x00000000
