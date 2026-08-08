.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_578
/* 199318 00299218 3B310000 */ .word 0x0000313B
/* 19931C 0029921C 00000000 */ .word 0x00000000
