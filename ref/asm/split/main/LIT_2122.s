.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2122
/* 19AD08 0029AC08 77686174 */ .word 0x74616877
/* 19AD0C 0029AC0C 73646179 */ .word 0x79616473
/* 19AD10 0029AC10 00000000 */ .word 0x00000000
/* 19AD14 0029AC14 00000000 */ .word 0x00000000
