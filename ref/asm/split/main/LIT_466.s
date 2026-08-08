.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_466
/* 199948 00299848 69000000 */ .word 0x00000069
/* 19994C 0029984C 00000000 */ .word 0x00000000
