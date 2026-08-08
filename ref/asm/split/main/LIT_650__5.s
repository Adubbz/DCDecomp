.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_650__5
/* 19E560 0029E460 6E6F7720 */ .word 0x20776F6E
/* 19E564 0029E464 61747261 */ .word 0x61727461
/* 19E568 0029E468 206C6F61 */ .word 0x616F6C20
/* 19E56C 0029E46C 64206172 */ .word 0x72612064
/* 19E570 0029E470 6561203D */ .word 0x3D206165
/* 19E574 0029E474 2025640A */ .word 0x0A642520
/* 19E578 0029E478 00000000 */ .word 0x00000000
/* 19E57C 0029E47C 00000000 */ .word 0x00000000
