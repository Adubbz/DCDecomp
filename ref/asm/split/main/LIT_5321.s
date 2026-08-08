.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_5321
/* 19DB90 0029DA90 28592000 */ .word .L00205928
/* 19DB94 0029DA94 28592000 */ .word .L00205928
/* 19DB98 0029DA98 28592000 */ .word .L00205928
/* 19DB9C 0029DA9C 28592000 */ .word .L00205928
/* 19DBA0 0029DAA0 28592000 */ .word .L00205928
/* 19DBA4 0029DAA4 28592000 */ .word .L00205928
/* 19DBA8 0029DAA8 00000000 */ .word 0x00000000
/* 19DBAC 0029DAAC 00000000 */ .word 0x00000000
