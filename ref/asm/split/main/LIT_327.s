.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_327
/* 199FF8 00299EF8 75726F6B */ .word 0x6B6F7275
/* 199FFC 00299EFC 6F000000 */ .word 0x0000006F
