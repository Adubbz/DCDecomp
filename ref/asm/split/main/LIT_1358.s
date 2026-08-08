.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1358
/* 19B6D8 0029B5D8 2E636667 */ .word 0x6766632E
/* 19B6DC 0029B5DC 00000000 */ .word 0x00000000
