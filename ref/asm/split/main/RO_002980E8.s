.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002980E8
/* 1981E8 002980E8 182D4454 */ .word 0x54442D18
/* 1981EC 002980EC FB21F93F */ .word 0x3FF921FB
