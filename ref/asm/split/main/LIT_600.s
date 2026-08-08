.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_600
/* 19C880 0029C780 6174706F */ .word 0x6F707461
/* 19C884 0029C784 77657200 */ .word GlobalDataBuffer + 0x47B4F7
