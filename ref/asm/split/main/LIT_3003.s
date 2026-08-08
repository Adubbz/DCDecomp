.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3003
/* 19B130 0029B030 65303263 */ .word 0x63323065
/* 19B134 0029B034 31330000 */ .word 0x00003331
