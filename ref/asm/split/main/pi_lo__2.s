.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pi_lo__2
/* 1984C4 002983C4 68212234 */ .word 0x34222168
