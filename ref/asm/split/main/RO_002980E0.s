.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002980E0
/* 1981E0 002980E0 00000000 */ .word 0x00000000
/* 1981E4 002980E4 00000080 */ .word 0x80000000
