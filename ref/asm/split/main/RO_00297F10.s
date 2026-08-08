.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297F10
/* 198010 00297F10 302E2564 */ .word 0x64252E30
/* 198014 00297F14 00000000 */ .word 0x00000000
