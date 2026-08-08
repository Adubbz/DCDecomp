.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_276
/* 199E00 00299D00 65646100 */ .word GlobalDataBuffer + 0x36B3E5
/* 199E04 00299D04 00000000 */ .word 0x00000000
