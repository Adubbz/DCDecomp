.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pio2_3t
/* 198430 00298330 C1492025 */ .word 0x252049C1
/* 198434 00298334 9A837B39 */ .word 0x397B839A
