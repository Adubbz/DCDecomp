.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1033
/* 19DFF8 0029DEF8 77302564 */ .word 0x64253077
/* 19DFFC 0029DEFC 00000000 */ .word 0x00000000
