.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2237
/* 19B210 0029B110 43504F4C */ .word 0x4C4F5043
/* 19B214 0029B114 59204F56 */ .word 0x564F2059
/* 19B218 0029B118 4552202A */ .word 0x2A205245
/* 19B21C 0029B11C 2A2A2A2A */ .word 0x2A2A2A2A
/* 19B220 0029B120 2A2A2A2A */ .word 0x2A2A2A2A
/* 19B224 0029B124 2A2A2A2A */ .word 0x2A2A2A2A
/* 19B228 0029B128 2A2A2A2A */ .word 0x2A2A2A2A
/* 19B22C 0029B12C 0A000000 */ .word 0x0000000A
