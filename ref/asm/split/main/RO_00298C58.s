.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298C58
/* 198D58 00298C58 44495343 */ .word 0x43534944
/* 198D5C 00298C5C 4F4E4E45 */ .word 0x454E4E4F
/* 198D60 00298C60 43540000 */ .word 0x00005443
/* 198D64 00298C64 00000000 */ .word 0x00000000
