.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_284
/* 1991B8 002990B8 6572726F */ .word 0x6F727265
/* 1991BC 002990BC 72206174 */ .word 0x74612072
/* 1991C0 002990C0 2025730A */ .word 0x0A732520
/* 1991C4 002990C4 00000000 */ .word 0x00000000
/* 1991C8 002990C8 00000000 */ .word 0x00000000
/* 1991CC 002990CC 00000000 */ .word 0x00000000
