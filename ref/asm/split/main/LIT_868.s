.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_868
/* 19BC78 0029BB78 7061636B */ .word 0x6B636170
/* 19BC7C 0029BB7C 203D2025 */ .word 0x25203D20
/* 19BC80 0029BB80 730A0000 */ .word 0x00000A73
/* 19BC84 0029BB84 00000000 */ .word 0x00000000
/* 19BC88 0029BB88 00000000 */ .word 0x00000000
/* 19BC8C 0029BB8C 00000000 */ .word 0x00000000
