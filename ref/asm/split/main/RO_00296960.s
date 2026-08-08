.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296960
/* 196A60 00296960 43000000 */ .word 0x00000043
/* 196A64 00296964 00000000 */ .word 0x00000000
