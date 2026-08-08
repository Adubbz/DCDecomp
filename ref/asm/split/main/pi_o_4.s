.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pi_o_4
/* 1981C0 002980C0 182D4454 */ .word 0x54442D18
/* 1981C4 002980C4 FB21E93F */ .word 0x3FE921FB
