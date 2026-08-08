.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298C68
/* 198D68 00298C68 42555359 */ .word 0x59535542
/* 198D6C 00298C6C 00000000 */ .word 0x00000000
