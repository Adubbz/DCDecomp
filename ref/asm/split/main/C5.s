.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel C5
/* 1988B8 002987B8 C4B1B4BD */ .word 0xBDB4B1C4
/* 1988BC 002987BC 9EEE213E */ .word 0x3E21EE9E
