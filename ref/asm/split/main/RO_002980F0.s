.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002980F0
/* 1981F0 002980F0 182D4454 */ .word 0x54442D18
/* 1981F4 002980F4 FB21F9BF */ .word 0xBFF921FB
