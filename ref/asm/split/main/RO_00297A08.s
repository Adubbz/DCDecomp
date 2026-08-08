.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297A08
/* 197B08 00297A08 44315F51 */ .word 0x515F3144
/* 197B0C 00297A0C 57433D25 */ .word 0x253D4357
/* 197B10 00297A10 3038783E */ .word 0x3E783830
/* 197B14 00297A14 0D0A0000 */ .word 0x00000A0D
