.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2604
/* 19B2A0 0029B1A0 73656C65 */ .word 0x656C6573
/* 19B2A4 0029B1A4 63742063 */ .word 0x63207463
/* 19B2A8 0029B1A8 68617261 */ .word 0x61726168
/* 19B2AC 0029B1AC 2025640A */ .word 0x0A642520
/* 19B2B0 0029B1B0 636F6C6C */ .word 0x6C6C6F63
/* 19B2B4 0029B1B4 6973696F */ .word 0x6F697369
/* 19B2B8 0029B1B8 6E202564 */ .word 0x6425206E
/* 19B2BC 0029B1BC 0A000000 */ .word 0x0000000A
