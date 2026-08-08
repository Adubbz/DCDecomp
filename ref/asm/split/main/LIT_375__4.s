.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_375__4
/* 19E620 0029E520 6461726B */ .word 0x6B726164
/* 19E624 0029E524 636C6F75 */ .word 0x756F6C63
/* 19E628 0029E528 64566572 */ .word 0x72655664
/* 19E62C 0029E52C 312E3900 */ .word GlobalDataBuffer + 0xE7DB1
