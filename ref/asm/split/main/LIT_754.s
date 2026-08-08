.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_754
/* 19C780 0029C680 63616D00 */ .word GlobalDataBuffer + 0x42B0E3
/* 19C784 0029C684 00000000 */ .word 0x00000000
