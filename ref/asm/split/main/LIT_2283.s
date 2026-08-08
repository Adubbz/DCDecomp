.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2283
/* 19BF60 0029BE60 5B735D25 */ .word 0x255D735B
/* 19BF64 0029BE64 640A0000 */ .word 0x00000A64
/* 19BF68 0029BE68 00000000 */ .word 0x00000000
/* 19BF6C 0029BE6C 00000000 */ .word 0x00000000
