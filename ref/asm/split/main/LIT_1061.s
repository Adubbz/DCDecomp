.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1061
/* 1996A8 002995A8 6D656D6F */ .word 0x6F6D656D
/* 1996AC 002995AC 72793031 */ .word 0x31307972
/* 1996B0 002995B0 00000000 */ .word 0x00000000
/* 1996B4 002995B4 00000000 */ .word 0x00000000
