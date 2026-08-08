.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_3075
/* 19C030 0029BF30 70B21C00 */ .word .L001CB270
/* 19C034 0029BF34 28B31C00 */ .word .L001CB328
/* 19C038 0029BF38 CCB31C00 */ .word .L001CB3CC
/* 19C03C 0029BF3C 70B41C00 */ .word .L001CB470
/* 19C040 0029BF40 14B51C00 */ .word .L001CB514
/* 19C044 0029BF44 B4B51C00 */ .word .L001CB5B4
/* 19C048 0029BF48 00000000 */ .word 0x00000000
/* 19C04C 0029BF4C 00000000 */ .word 0x00000000
