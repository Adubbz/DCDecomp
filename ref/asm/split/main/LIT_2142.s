.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2142
/* 19D458 0029D358 70343161 */ .word 0x61313470
/* 19D45C 0029D35C 00000000 */ .word 0x00000000
