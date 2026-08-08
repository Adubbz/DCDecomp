.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_804
/* 19BC18 0029BB18 73746179 */ .word 0x79617473
/* 19BC1C 0029BB1C 6672616D */ .word 0x6D617266
/* 19BC20 0029BB20 65000000 */ .word 0x00000065
/* 19BC24 0029BB24 00000000 */ .word 0x00000000
