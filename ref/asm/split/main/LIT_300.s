.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_300
/* 199F08 00299E08 726F7532 */ .word 0x32756F72
/* 199F0C 00299E0C 202D6B61 */ .word 0x616B2D20
/* 199F10 00299E10 62653200 */ .word GlobalDataBuffer + 0x7B4E2
/* 199F14 00299E14 00000000 */ .word 0x00000000
