.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1518
/* 19D068 0029CF68 656C656D */ .word 0x6D656C65
/* 19D06C 0029CF6C 656E7420 */ .word 0x20746E65
/* 19D070 0029CF70 3D202564 */ .word 0x6425203D
/* 19D074 0029CF74 0A000000 */ .word 0x0000000A
