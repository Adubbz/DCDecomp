.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_870__2
/* 19DE70 0029DD70 76616C75 */ .word 0x756C6176
/* 19DE74 0029DD74 653D300A */ .word 0x0A303D65
/* 19DE78 0029DD78 00000000 */ .word 0x00000000
/* 19DE7C 0029DD7C 00000000 */ .word 0x00000000
