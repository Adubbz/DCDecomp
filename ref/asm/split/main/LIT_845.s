.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_845
/* 19F030 0029EF30 6B616973 */ .word 0x7369616B
/* 19F034 0029EF34 6F750000 */ .word 0x0000756F
