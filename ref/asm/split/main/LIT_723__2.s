.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_723__2
/* 19AAD0 0029A9D0 666F6E74 */ .word 0x746E6F66
/* 19AAD4 0029A9D4 5F627566 */ .word 0x6675625F
/* 19AAD8 0029A9D8 66000000 */ .word 0x00000066
/* 19AADC 0029A9DC 00000000 */ .word 0x00000000
