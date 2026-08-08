.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3159
/* 19D550 0029D450 67657469 */ .word 0x69746567
/* 19D554 0029D454 6E666F20 */ .word 0x206F666E
/* 19D558 0029D458 6973204E */ .word 0x4E207369
/* 19D55C 0029D45C 554C4C0A */ .word 0x0A4C4C55
/* 19D560 0029D460 00000000 */ .word 0x00000000
/* 19D564 0029D464 00000000 */ .word 0x00000000
