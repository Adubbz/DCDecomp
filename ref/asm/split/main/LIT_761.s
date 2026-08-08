.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_761
/* 19D260 0029D160 73746179 */ .word 0x79617473
/* 19D264 0029D164 6672616D */ .word 0x6D617266
/* 19D268 0029D168 65000000 */ .word 0x00000065
/* 19D26C 0029D16C 00000000 */ .word 0x00000000
