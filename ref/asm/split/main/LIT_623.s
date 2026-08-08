.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_623
/* 19A218 0029A118 68616D6F */ .word 0x6F6D6168
/* 19A21C 0029A11C 6E000000 */ .word 0x0000006E
