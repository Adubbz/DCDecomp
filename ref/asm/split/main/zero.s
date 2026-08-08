.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel zero
/* 1981B8 002980B8 00000000 */ .word 0x00000000
/* 1981BC 002980BC 00000000 */ .word 0x00000000
