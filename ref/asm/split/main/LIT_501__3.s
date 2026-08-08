.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_501__3
/* 19C188 0029C088 50545F42 */ .word 0x425F5450
/* 19C18C 0029C08C 41534500 */ .word GlobalDataBuffer + 0x1AA2C1
