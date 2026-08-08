.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002988D0
/* 1989D0 002988D0 49555555 */ .word 0x55555549
/* 1989D4 002988D4 5555C5BF */ .word 0xBFC55555
