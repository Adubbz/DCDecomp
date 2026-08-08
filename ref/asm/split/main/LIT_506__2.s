.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_506__2
/* 19C1B8 0029C0B8 50545F47 */ .word 0x475F5450
/* 19C1BC 0029C0BC 4C494748 */ .word 0x4847494C
/* 19C1C0 0029C0C0 54000000 */ .word 0x00000054
/* 19C1C4 0029C0C4 00000000 */ .word 0x00000000
