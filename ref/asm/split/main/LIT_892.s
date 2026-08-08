.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_892
/* 1995F0 002994F0 25736576 */ .word 0x76657325
/* 1995F4 002994F4 656E7425 */ .word 0x25746E65
/* 1995F8 002994F8 640A0000 */ .word 0x00000A64
/* 1995FC 002994FC 00000000 */ .word 0x00000000
