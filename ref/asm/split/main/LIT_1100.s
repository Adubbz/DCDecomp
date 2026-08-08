.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1100
/* 19F578 0029F478 6275696C */ .word 0x6C697562
/* 19F57C 0029F47C 64757000 */ .word GlobalDataBuffer + 0x45C4E4
