.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_997
/* 19DFC8 0029DEC8 63313800 */ .word GlobalDataBuffer + 0xD80E3
/* 19DFCC 0029DECC 00000000 */ .word 0x00000000
