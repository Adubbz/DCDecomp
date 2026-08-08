.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002988C8
/* 1989C8 002988C8 49555555 */ .word 0x55555549
/* 1989CC 002988CC 5555C5BF */ .word 0xBFC55555
