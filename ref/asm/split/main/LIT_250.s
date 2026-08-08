.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_250
/* 198F08 00298E08 25642025 */ .word 0x25206425
/* 198F0C 00298E0C 64202564 */ .word 0x64252064
/* 198F10 00298E10 0A000000 */ .word 0x0000000A
/* 198F14 00298E14 00000000 */ .word 0x00000000
/* 198F18 00298E18 00000000 */ .word 0x00000000
/* 198F1C 00298E1C 00000000 */ .word 0x00000000
