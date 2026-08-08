.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2607
/* 19B2D0 0029B1D0 20616D62 */ .word 0x626D6120
/* 19B2D4 0029B1D4 2025352E */ .word 0x2E352520
/* 19B2D8 0029B1D8 31662025 */ .word 0x25206631
/* 19B2DC 0029B1DC 352E3166 */ .word 0x66312E35
/* 19B2E0 0029B1E0 2025352E */ .word 0x2E352520
/* 19B2E4 0029B1E4 31662025 */ .word 0x25206631
/* 19B2E8 0029B1E8 352E3166 */ .word 0x66312E35
/* 19B2EC 0029B1EC 0A000000 */ .word 0x0000000A
