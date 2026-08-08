.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_254__2
/* 199D30 00299C30 73616B75 */ .word 0x756B6173
/* 199D34 00299C34 00000000 */ .word 0x00000000
