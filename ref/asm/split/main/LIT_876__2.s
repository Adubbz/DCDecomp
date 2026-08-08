.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_876__2
/* 19A988 0029A888 524F4F4D */ .word 0x4D4F4F52
/* 19A98C 0029A88C 00000000 */ .word 0x00000000
