.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2488
/* 19AD80 0029AC80 64756E67 */ .word 0x676E7564
/* 19AD84 0029AC84 656F6E00 */ .word GlobalDataBuffer + 0x43BEE5
/* 19AD88 0029AC88 00000000 */ .word 0x00000000
/* 19AD8C 0029AC8C 00000000 */ .word 0x00000000
