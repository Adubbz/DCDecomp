.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2756
/* 19AF40 0029AE40 23667261 */ .word 0x61726623
/* 19AF44 0029AE44 6D655F69 */ .word 0x695F656D
/* 19AF48 0029AE48 6D616765 */ .word 0x6567616D
/* 19AF4C 0029AE4C 23363430 */ .word 0x30343623
/* 19AF50 0029AE50 23343438 */ .word 0x38343423
/* 19AF54 0029AE54 23340000 */ .word 0x00003423
/* 19AF58 0029AE58 00000000 */ .word 0x00000000
/* 19AF5C 0029AE5C 00000000 */ .word 0x00000000
