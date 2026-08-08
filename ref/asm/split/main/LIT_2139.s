.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2139
/* 19D440 0029D340 70343961 */ .word 0x61393470
/* 19D444 0029D344 00000000 */ .word 0x00000000
