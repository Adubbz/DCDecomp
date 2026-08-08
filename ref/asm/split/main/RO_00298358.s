.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298358
/* 198458 00298358 00004054 */ .word 0x54400000
/* 19845C 0029835C FB21F93F */ .word 0x3FF921FB
