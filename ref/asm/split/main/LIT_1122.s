.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1122
/* 19E958 0029E858 666F726D */ .word 0x6D726F66
/* 19E95C 0029E85C 61742066 */ .word 0x66207461
/* 19E960 0029E860 61696C65 */ .word 0x656C6961
/* 19E964 0029E864 640A0000 */ .word 0x00000A64
/* 19E968 0029E868 00000000 */ .word 0x00000000
/* 19E96C 0029E86C 00000000 */ .word 0x00000000
