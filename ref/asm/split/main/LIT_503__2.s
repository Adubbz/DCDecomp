.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_503__2
/* 19C198 0029C098 50545F43 */ .word 0x435F5450
/* 19C19C 0029C09C 414D0000 */ .word 0x00004D41
