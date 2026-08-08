.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_524
/* 19C2C0 0029C1C0 50545F48 */ .word 0x485F5450
/* 19C2C4 0029C1C4 45414C5F */ .word 0x5F4C4145
/* 19C2C8 0029C1C8 5A4F4E45 */ .word 0x454E4F5A
/* 19C2CC 0029C1CC 00000000 */ .word 0x00000000
