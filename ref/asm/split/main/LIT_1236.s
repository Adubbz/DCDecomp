.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1236
/* 19E220 0029E120 55536572 */ .word 0x72655355
/* 19E224 0029E124 53746174 */ .word 0x74617453
/* 19E228 0029E128 75732069 */ .word 0x69207375
/* 19E22C 0029E12C 73204E55 */ .word 0x554E2073
/* 19E230 0029E130 4C4C0A00 */ .word 0x000A4C4C
/* 19E234 0029E134 00000000 */ .word 0x00000000
