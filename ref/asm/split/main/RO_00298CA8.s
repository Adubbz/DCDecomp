.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298CA8
/* 198DA8 00298CA8 6572726F */ .word 0x6F727265
/* 198DAC 00298CAC 72200A00 */ .word 0x000A2072
