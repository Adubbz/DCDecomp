.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1111
/* 19E130 0029E030 5765704D */ .word 0x4D706557
/* 19E134 0029E034 656E7545 */ .word 0x45756E65
/* 19E138 0029E038 66666563 */ .word 0x63656666
/* 19E13C 0029E03C 74526561 */ .word 0x61655274
/* 19E140 0029E040 64427566 */ .word 0x66754264
/* 19E144 0029E044 203D2025 */ .word 0x25203D20
/* 19E148 0029E048 700A0000 */ .word 0x00000A70
/* 19E14C 0029E04C 00000000 */ .word 0x00000000
