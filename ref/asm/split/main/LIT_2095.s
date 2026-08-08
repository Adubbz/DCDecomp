.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2095
/* 199C88 00299B88 666F6E74 */ .word 0x746E6F66
/* 199C8C 00299B8C 62617365 */ .word 0x65736162
/* 199C90 00299B90 00000000 */ .word 0x00000000
/* 199C94 00299B94 00000000 */ .word 0x00000000
