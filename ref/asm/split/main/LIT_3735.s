.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3735
/* 19EF10 0029EE10 6E657769 */ .word 0x6977656E
/* 19EF14 0029EE14 74656D6E */ .word 0x6E6D6574
/* 19EF18 0029EE18 6F206973 */ .word 0x7369206F
/* 19EF1C 0029EE1C 2025640A */ .word 0x0A642520
/* 19EF20 0029EE20 00000000 */ .word 0x00000000
/* 19EF24 0029EE24 00000000 */ .word 0x00000000
/* 19EF28 0029EE28 00000000 */ .word 0x00000000
/* 19EF2C 0029EE2C 00000000 */ .word 0x00000000
