.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_656__5
/* 19CB80 0029CA80 6E656261 */ .word 0x6162656E
/* 19CB84 0029CA84 70656163 */ .word 0x63616570
/* 19CB88 0029CA88 00000000 */ .word 0x00000000
/* 19CB8C 0029CA8C 00000000 */ .word 0x00000000
