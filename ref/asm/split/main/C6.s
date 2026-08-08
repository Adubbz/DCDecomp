.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel C6
/* 1988C0 002987C0 D43888BE */ .word 0xBE8838D4
/* 1988C4 002987C4 E9FAA8BD */ .word 0xBDA8FAE9
