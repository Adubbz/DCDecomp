.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_403
/* 19A150 0029A050 656E6400 */ .word GlobalDataBuffer + 0x39BDE5
/* 19A154 0029A054 00000000 */ .word 0x00000000
/* 19A158 0029A058 00000000 */ .word 0x00000000
/* 19A15C 0029A05C 00000000 */ .word 0x00000000
