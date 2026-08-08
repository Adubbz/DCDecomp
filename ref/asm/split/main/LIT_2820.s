.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2820
/* 19B078 0029AF78 73746179 */ .word 0x79617473
/* 19B07C 0029AF7C 6672616D */ .word 0x6D617266
/* 19B080 0029AF80 652E696D */ .word 0x6D692E65
/* 19B084 0029AF84 67000000 */ .word 0x00000067
