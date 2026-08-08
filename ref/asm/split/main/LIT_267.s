.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_267
/* 199DA8 00299CA8 68616E65 */ .word 0x656E6168
/* 199DAC 00299CAC 00000000 */ .word 0x00000000
