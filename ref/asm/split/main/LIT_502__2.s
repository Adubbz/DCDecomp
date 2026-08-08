.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_502__2
/* 19C190 0029C090 50545F43 */ .word 0x435F5450
/* 19C194 0029C094 4F4C5300 */ .word GlobalDataBuffer + 0x289BCF
