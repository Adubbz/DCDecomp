.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298128
/* 198228 00298128 182D4454 */ .word 0x54442D18
/* 19822C 0029812C FB21F93F */ .word 0x3FF921FB
