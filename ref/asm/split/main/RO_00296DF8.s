.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296DF8
/* 196EF8 00296DF8 62756720 */ .word 0x20677562
/* 196EFC 00296DFC 696E2076 */ .word 0x76206E69
/* 196F00 00296E00 66707269 */ .word 0x69727066
/* 196F04 00296E04 6E74663A */ .word 0x3A66746E
/* 196F08 00296E08 20626164 */ .word 0x64616220
/* 196F0C 00296E0C 20626173 */ .word 0x73616220
/* 196F10 00296E10 65000000 */ .word 0x00000065
/* 196F14 00296E14 00000000 */ .word 0x00000000
