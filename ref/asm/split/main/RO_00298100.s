.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298100
/* 198200 00298100 182D4454 */ .word 0x54442D18
/* 198204 00298104 FB21E9BF */ .word 0xBFE921FB
