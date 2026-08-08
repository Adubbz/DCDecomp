.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2251
/* 19EBE0 0029EAE0 23667261 */ .word 0x61726623
/* 19EBE4 0029EAE4 6D655F69 */ .word 0x695F656D
/* 19EBE8 0029EAE8 6D616765 */ .word 0x6567616D
/* 19EBEC 0029EAEC 5F6F7074 */ .word 0x74706F5F
/* 19EBF0 0029EAF0 696F6E23 */ .word 0x236E6F69
/* 19EBF4 0029EAF4 36343023 */ .word 0x23303436
/* 19EBF8 0029EAF8 34343823 */ .word 0x23383434
/* 19EBFC 0029EAFC 34000000 */ .word 0x00000034
