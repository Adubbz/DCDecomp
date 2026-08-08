.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_525
/* 19C2D0 0029C1D0 50545F48 */ .word 0x485F5450
/* 19C2D4 0029C1D4 49545F4D */ .word 0x4D5F5449
/* 19C2D8 0029C1D8 41524B45 */ .word 0x454B5241
/* 19C2DC 0029C1DC 52000000 */ .word 0x00000052
