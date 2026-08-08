.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_540__2
/* 19BEA0 0029BDA0 47657449 */ .word 0x49746547
/* 19BEA4 0029BDA4 54454D20 */ .word 0x204D4554
/* 19BEA8 0029BDA8 4E6F203D */ .word 0x3D206F4E
/* 19BEAC 0029BDAC 3D3D2025 */ .word 0x25203D3D
/* 19BEB0 0029BDB0 640A0000 */ .word 0x00000A64
/* 19BEB4 0029BDB4 00000000 */ .word 0x00000000
/* 19BEB8 0029BDB8 00000000 */ .word 0x00000000
/* 19BEBC 0029BDBC 00000000 */ .word 0x00000000
