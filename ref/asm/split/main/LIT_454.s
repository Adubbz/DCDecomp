.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_454
/* 19F3B0 0029F2B0 73743100 */ .word GlobalDataBuffer + 0x6C3F3
/* 19F3B4 0029F2B4 00000000 */ .word 0x00000000
