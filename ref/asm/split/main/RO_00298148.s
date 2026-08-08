.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298148
/* 198248 00298148 182D4454 */ .word 0x54442D18
/* 19824C 0029814C FB210940 */ .word 0x400921FB
