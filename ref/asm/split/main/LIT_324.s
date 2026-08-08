.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_324
/* 199FE0 00299EE0 6E657A69 */ .word 0x697A656E
/* 199FE4 00299EE4 72650000 */ .word 0x00006572
