.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_310__2
/* 19A5C0 0029A4C0 70363261 */ .word 0x61323670
/* 19A5C4 0029A4C4 00000000 */ .word 0x00000000
