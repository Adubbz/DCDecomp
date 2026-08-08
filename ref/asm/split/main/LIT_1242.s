.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1242
/* 19E238 0029E138 77657069 */ .word 0x69706577
/* 19E23C 0029E13C 636F6E2E */ .word 0x2E6E6F63
/* 19E240 0029E140 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19E244 0029E144 00000000 */ .word 0x00000000
/* 19E248 0029E148 00000000 */ .word 0x00000000
/* 19E24C 0029E14C 00000000 */ .word 0x00000000
