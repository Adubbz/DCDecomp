.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_618
/* 19C978 0029C878 7A617475 */ .word 0x7574617A
/* 19C97C 0029C87C 6E646564 */ .word 0x6465646E
/* 19C980 0029C880 00000000 */ .word 0x00000000
/* 19C984 0029C884 00000000 */ .word 0x00000000
