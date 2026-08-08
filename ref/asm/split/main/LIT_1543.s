.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1543
/* 19B9D0 0029B8D0 4F4E0000 */ .word 0x00004E4F
/* 19B9D4 0029B8D4 00000000 */ .word 0x00000000
