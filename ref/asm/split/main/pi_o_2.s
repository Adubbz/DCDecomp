.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pi_o_2
/* 1981C8 002980C8 182D4454 */ .word 0x54442D18
/* 1981CC 002980CC FB21F93F */ .word 0x3FF921FB
