.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2340__2
/* 19D9B0 0029D8B0 6E6F7720 */ .word 0x20776F6E
/* 19D9B4 0029D8B4 61637469 */ .word 0x69746361
/* 19D9B8 0029D8B8 76652076 */ .word 0x76206576
/* 19D9BC 0029D8BC 6F6C2020 */ .word 0x20206C6F
/* 19D9C0 0029D8C0 3D202564 */ .word 0x6425203D
/* 19D9C4 0029D8C4 0A000000 */ .word 0x0000000A
