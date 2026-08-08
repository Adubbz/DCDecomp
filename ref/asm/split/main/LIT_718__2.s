.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_718__2
/* 19CEA0 0029CDA0 68656E67 */ .word 0x676E6568
/* 19CEA4 0029CDA4 656D697A */ .word 0x7A696D65
/* 19CEA8 0029CDA8 00000000 */ .word 0x00000000
/* 19CEAC 0029CDAC 00000000 */ .word 0x00000000
