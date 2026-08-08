.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_843__2
/* 19F010 0029EF10 64756E65 */ .word 0x656E7564
/* 19F014 0029EF14 6E746572 */ .word 0x7265746E
/* 19F018 0029EF18 2E696D67 */ .word 0x676D692E
/* 19F01C 0029EF1C 00000000 */ .word 0x00000000
