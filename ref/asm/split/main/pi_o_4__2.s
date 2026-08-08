.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pi_o_4__2
/* 1984B8 002983B8 DB0F493F */ .word 0x3F490FDB
