.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_733
/* 1990A0 00298FA0 4D4F5449 */ .word 0x49544F4D
/* 1990A4 00298FA4 4F4E5F45 */ .word 0x455F4E4F
/* 1990A8 00298FA8 4E440000 */ .word 0x0000444E
/* 1990AC 00298FAC 00000000 */ .word 0x00000000
