.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1626
/* 19BB68 0029BA68 48656967 */ .word 0x67696548
/* 19BB6C 0029BA6C 6874203D */ .word 0x3D207468
/* 19BB70 0029BA70 20252E33 */ .word 0x332E2520
/* 19BB74 0029BA74 660A0000 */ .word 0x00000A66
/* 19BB78 0029BA78 00000000 */ .word 0x00000000
/* 19BB7C 0029BA7C 00000000 */ .word 0x00000000
