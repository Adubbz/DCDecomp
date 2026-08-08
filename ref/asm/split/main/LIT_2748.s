.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2748
/* 19AE90 0029AD90 23736861 */ .word 0x61687323
/* 19AE94 0029AD94 646F775F */ .word 0x5F776F64
/* 19AE98 0029AD98 62756666 */ .word 0x66667562
/* 19AE9C 0029AD9C 23363430 */ .word 0x30343623
/* 19AEA0 0029ADA0 23323234 */ .word 0x34323223
/* 19AEA4 0029ADA4 23340000 */ .word 0x00003423
/* 19AEA8 0029ADA8 00000000 */ .word 0x00000000
/* 19AEAC 0029ADAC 00000000 */ .word 0x00000000
