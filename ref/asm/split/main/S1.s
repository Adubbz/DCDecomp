.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel S1
/* 198970 00298870 49555555 */ .word 0x55555549
/* 198974 00298874 5555C5BF */ .word 0xBFC55555
