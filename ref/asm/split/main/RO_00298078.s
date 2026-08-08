.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298078
/* 198178 00298078 616C6C00 */ .word GlobalDataBuffer + 0x41BBE1
/* 19817C 0029807C 00000000 */ .word 0x00000000
