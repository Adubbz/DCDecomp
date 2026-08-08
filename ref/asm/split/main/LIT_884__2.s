.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_884__2
/* 1995A0 002994A0 6672616D */ .word 0x6D617266
/* 1995A4 002994A4 655F6275 */ .word 0x75625F65
/* 1995A8 002994A8 66660000 */ .word 0x00006666
/* 1995AC 002994AC 00000000 */ .word 0x00000000
