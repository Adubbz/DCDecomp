.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296DB0
/* 196EB0 00296DB0 496E6600 */ .word GlobalDataBuffer + 0x3BBDC9
/* 196EB4 00296DB4 00000000 */ .word 0x00000000
