.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_604
/* 19B5C0 0029B4C0 65727220 */ .word 0x20727265
/* 19B5C4 0029B4C4 25640A00 */ .word 0x000A6425
