.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_817
/* 19BE38 0029BD38 67657420 */ .word 0x20746567
/* 19BE3C 0029BD3C 6964203D */ .word 0x3D206469
/* 19BE40 0029BD40 2025640A */ .word 0x0A642520
/* 19BE44 0029BD44 00000000 */ .word 0x00000000
