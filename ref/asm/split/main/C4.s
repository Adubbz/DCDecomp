.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel C4
/* 1988B0 002987B0 AD529C80 */ .word 0x809C52AD
/* 1988B4 002987B4 4F7E92BE */ .word 0xBE927E4F
