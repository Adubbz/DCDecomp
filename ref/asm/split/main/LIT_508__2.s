.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_508__2
/* 19C1D8 0029C0D8 50545F54 */ .word 0x545F5450
/* 19C1DC 0029C0DC 414B4930 */ .word 0x30494B41
/* 19C1E0 0029C0E0 30000000 */ .word 0x00000030
/* 19C1E4 0029C0E4 00000000 */ .word 0x00000000
