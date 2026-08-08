.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pi
/* 1981D0 002980D0 182D4454 */ .word 0x54442D18
/* 1981D4 002980D4 FB210940 */ .word 0x400921FB
