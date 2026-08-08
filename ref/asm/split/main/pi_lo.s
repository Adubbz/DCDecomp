.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pi_lo
/* 1981D8 002980D8 075C1433 */ .word 0x33145C07
/* 1981DC 002980DC 26A6A13C */ .word 0x3CA1A626
