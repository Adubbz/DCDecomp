.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002980F8
/* 1981F8 002980F8 182D4454 */ .word 0x54442D18
/* 1981FC 002980FC FB21E93F */ .word 0x3FE921FB
