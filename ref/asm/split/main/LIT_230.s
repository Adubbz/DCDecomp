.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_230
/* 199168 00299068 616E6B66 */ .word 0x666B6E61
/* 19916C 0029906C 6E743234 */ .word 0x3432746E
/* 199170 00299070 00000000 */ .word 0x00000000
/* 199174 00299074 00000000 */ .word 0x00000000
