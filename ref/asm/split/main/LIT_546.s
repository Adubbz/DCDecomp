.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_546
/* 199988 00299888 0A0D0000 */ .word 0x00000D0A
/* 19998C 0029988C 00000000 */ .word 0x00000000
