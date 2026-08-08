.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296E18
/* 196F18 00296E18 30000000 */ .word 0x00000030
/* 196F1C 00296E1C 00000000 */ .word 0x00000000
