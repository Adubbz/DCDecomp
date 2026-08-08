.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel C3
/* 1988A8 002987A8 9015CB19 */ .word 0x19CB1590
/* 1988AC 002987AC A001FA3E */ .word 0x3EFA01A0
