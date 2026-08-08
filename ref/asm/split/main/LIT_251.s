.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_251
/* 198F20 00298E20 686F7374 */ .word 0x74736F68
/* 198F24 00298E24 303A793A */ .word 0x3A793A30
/* 198F28 00298E28 2F707332 */ .word 0x3273702F
/* 198F2C 00298E2C 2F636170 */ .word 0x7061632F
/* 198F30 00298E30 74757265 */ .word 0x65727574
/* 198F34 00298E34 2F000000 */ .word 0x0000002F
