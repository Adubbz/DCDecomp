.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296DE0
/* 196EE0 00296DE0 30313233 */ .word 0x33323130
/* 196EE4 00296DE4 34353637 */ .word 0x37363534
/* 196EE8 00296DE8 38394142 */ .word 0x42413938
/* 196EEC 00296DEC 43444546 */ .word 0x46454443
/* 196EF0 00296DF0 00000000 */ .word 0x00000000
/* 196EF4 00296DF4 00000000 */ .word 0x00000000
