.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1250
/* 19E268 0029E168 64636F6C */ .word 0x6C6F6364
/* 19E26C 0029E16C 30000000 */ .word 0x00000030
