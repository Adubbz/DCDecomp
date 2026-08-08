.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_504
/* 19C1A0 0029C0A0 50545F46 */ .word 0x465F5450
/* 19C1A4 0029C0A4 49524500 */ .word GlobalDataBuffer + 0x1AA1C9
