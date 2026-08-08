.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel zero__2
/* 1983E8 002982E8 00000000 */ .word 0x00000000
/* 1983EC 002982EC 00000000 */ .word 0x00000000
