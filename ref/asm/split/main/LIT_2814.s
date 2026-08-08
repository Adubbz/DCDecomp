.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2814
/* 19B030 0029AF30 63757273 */ .word 0x73727563
/* 19B034 0029AF34 6F723032 */ .word 0x3230726F
/* 19B038 0029AF38 2E6D6473 */ .word 0x73646D2E
/* 19B03C 0029AF3C 00000000 */ .word 0x00000000
