.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2821
/* 19B088 0029AF88 73746179 */ .word 0x79617473
/* 19B08C 0029AF8C 6672616D */ .word 0x6D617266
/* 19B090 0029AF90 65000000 */ .word 0x00000065
/* 19B094 0029AF94 00000000 */ .word 0x00000000
