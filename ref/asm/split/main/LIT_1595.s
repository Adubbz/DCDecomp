.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1595
/* 19B498 0029B398 42475F43 */ .word 0x435F4742
/* 19B49C 0029B39C 4F4C0000 */ .word 0x00004C4F
