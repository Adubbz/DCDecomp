.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1470
/* 19BF28 0029BE28 6D696E69 */ .word 0x696E696D
/* 19BF2C 0029BE2C 6D617031 */ .word 0x3170616D
/* 19BF30 0029BE30 00000000 */ .word 0x00000000
/* 19BF34 0029BE34 00000000 */ .word 0x00000000
