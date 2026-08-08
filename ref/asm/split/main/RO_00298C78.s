.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298C78
/* 198D78 00298C78 434F4D50 */ .word 0x504D4F43
/* 198D7C 00298C7C 4C455445 */ .word 0x4554454C
/* 198D80 00298C80 00000000 */ .word 0x00000000
/* 198D84 00298C84 00000000 */ .word 0x00000000
