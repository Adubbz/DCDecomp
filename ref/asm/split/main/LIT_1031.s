.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1031
/* 19E8D8 0029E7D8 636D6420 */ .word 0x20646D63
/* 19E8DC 0029E7DC 3D202564 */ .word 0x6425203D
/* 19E8E0 0029E7E0 0A000000 */ .word 0x0000000A
/* 19E8E4 0029E7E4 00000000 */ .word 0x00000000
