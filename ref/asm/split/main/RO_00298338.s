.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298338
/* 198438 00298338 00004054 */ .word 0x54400000
/* 19843C 0029833C FB21F93F */ .word 0x3FF921FB
