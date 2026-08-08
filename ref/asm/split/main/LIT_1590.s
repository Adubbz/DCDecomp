.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1590
/* 19B478 0029B378 69303165 */ .word 0x65313069
/* 19B47C 0029B37C 30310000 */ .word 0x00003130
