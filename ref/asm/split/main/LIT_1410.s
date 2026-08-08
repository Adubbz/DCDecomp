.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1410
/* 19EB08 0029EA08 636F6D70 */ .word 0x706D6F63
/* 19EB0C 0029EA0C 6C657465 */ .word 0x6574656C
/* 19EB10 0029EA10 00000000 */ .word 0x00000000
/* 19EB14 0029EA14 00000000 */ .word 0x00000000
