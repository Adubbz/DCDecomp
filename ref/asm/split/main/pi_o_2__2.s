.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pi_o_2__2
/* 1984BC 002983BC DB0FC93F */ .word 0x3FC90FDB
