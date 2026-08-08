.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1162
/* 19C510 0029C410 6F766572 */ .word 0x7265766F
/* 19C514 0029C414 20667261 */ .word 0x61726620
/* 19C518 0029C418 6D652061 */ .word 0x6120656D
/* 19C51C 0029C41C 6E696D21 */ .word 0x216D696E
/* 19C520 0029C420 0A000000 */ .word 0x0000000A
/* 19C524 0029C424 00000000 */ .word 0x00000000
/* 19C528 0029C428 00000000 */ .word 0x00000000
/* 19C52C 0029C42C 00000000 */ .word 0x00000000
