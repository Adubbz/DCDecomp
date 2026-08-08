.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_523
/* 19C2B0 0029C1B0 50545F53 */ .word 0x535F5450
/* 19C2B4 0029C1B4 43414C45 */ .word 0x454C4143
/* 19C2B8 0029C1B8 00000000 */ .word 0x00000000
/* 19C2BC 0029C1BC 00000000 */ .word 0x00000000
