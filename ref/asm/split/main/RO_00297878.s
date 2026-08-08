.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297878
/* 197978 00297878 65680000 */ .word 0x00006865
/* 19797C 0029787C 00000000 */ .word 0x00000000
