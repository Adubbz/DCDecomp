.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002968E8
/* 1969E8 002968E8 B3C8608B */ .word 0x8B60C8B3
/* 1969EC 002968EC 288AC63F */ .word 0x3FC68A28
