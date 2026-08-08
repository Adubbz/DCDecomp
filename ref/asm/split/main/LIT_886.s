.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_886
/* 1995B0 002994B0 67616D65 */ .word 0x656D6167
/* 1995B4 002994B4 20737461 */ .word 0x61747320
/* 1995B8 002994B8 72740000 */ .word 0x00007472
/* 1995BC 002994BC 00000000 */ .word 0x00000000
