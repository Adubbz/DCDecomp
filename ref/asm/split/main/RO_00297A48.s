.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297A48
/* 197B48 00297A48 44325F51 */ .word 0x515F3244
/* 197B4C 00297A4C 57433D25 */ .word 0x253D4357
/* 197B50 00297A50 3038783E */ .word 0x3E783830
/* 197B54 00297A54 0D0A0000 */ .word 0x00000A0D
