.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_654
/* 19C300 0029C200 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C304 0029C204 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C308 0029C208 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C30C 0029C20C 54414720 */ .word 0x20474154
/* 19C310 0029C210 4F564552 */ .word 0x5245564F
/* 19C314 0029C214 21210A00 */ .word 0x000A2121
