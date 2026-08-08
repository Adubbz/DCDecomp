.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1086
/* 199788 00299688 73746179 */ .word 0x79617473
/* 19978C 0029968C 6672616D */ .word 0x6D617266
/* 199790 00299690 652E696D */ .word 0x6D692E65
/* 199794 00299694 67000000 */ .word 0x00000067
