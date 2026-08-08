.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_947
/* 19BD58 0029BC58 2E636667 */ .word 0x6766632E
/* 19BD5C 0029BC5C 00000000 */ .word 0x00000000
