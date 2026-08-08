.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2356
/* 19D9C8 0029D8C8 6E6F7720 */ .word 0x20776F6E
/* 19D9CC 0029D8CC 656C656D */ .word 0x6D656C65
/* 19D9D0 0029D8D0 203D2025 */ .word 0x25203D20
/* 19D9D4 0029D8D4 640A0000 */ .word 0x00000A64
/* 19D9D8 0029D8D8 00000000 */ .word 0x00000000
/* 19D9DC 0029D8DC 00000000 */ .word 0x00000000
