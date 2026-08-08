.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296DB8
/* 196EB8 00296DB8 4E614E00 */ .word GlobalDataBuffer + 0x23B0CE
/* 196EBC 00296DBC 00000000 */ .word 0x00000000
