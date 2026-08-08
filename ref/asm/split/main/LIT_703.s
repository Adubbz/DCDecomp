.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_703
/* 19B638 0029B538 64303065 */ .word 0x65303064
/* 19B63C 0029B53C 30310000 */ .word 0x00003130
