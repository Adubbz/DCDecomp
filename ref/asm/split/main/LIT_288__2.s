.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_288__2
/* 199E80 00299D80 63617233 */ .word 0x33726163
/* 199E84 00299D84 00000000 */ .word 0x00000000
