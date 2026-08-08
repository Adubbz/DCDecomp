.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_869
/* 19DE60 0029DD60 74727565 */ .word 0x65757274
/* 19DE64 0029DD64 4E6F203D */ .word 0x3D206F4E
/* 19DE68 0029DD68 2025640A */ .word 0x0A642520
/* 19DE6C 0029DD6C 00000000 */ .word 0x00000000
