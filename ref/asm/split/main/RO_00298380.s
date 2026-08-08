.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298380
/* 198480 00298380 00004054 */ .word 0x54400000
/* 198484 00298384 FB21F93F */ .word 0x3FF921FB
