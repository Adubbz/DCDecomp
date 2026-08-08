.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2140__2
/* 19F200 0029F100 2D2D2D2D */ .word 0x2D2D2D2D
/* 19F204 0029F104 2D497465 */ .word 0x6574492D
/* 19F208 0029F108 6D446174 */ .word 0x7461446D
/* 19F20C 0029F10C 61205669 */ .word 0x69562061
/* 19F210 0029F110 65772D2D */ .word 0x2D2D7765
/* 19F214 0029F114 2D2D2D0A */ .word 0x0A2D2D2D
/* 19F218 0029F118 00000000 */ .word 0x00000000
/* 19F21C 0029F11C 00000000 */ .word 0x00000000
