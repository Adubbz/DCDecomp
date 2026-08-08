.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_636__2
/* 19CA78 0029C978 6E696E6A */ .word 0x6A6E696E
/* 19CA7C 0029C97C 6E636B69 */ .word 0x696B636E
/* 19CA80 0029C980 00000000 */ .word 0x00000000
/* 19CA84 0029C984 00000000 */ .word 0x00000000
