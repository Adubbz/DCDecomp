.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_513
/* 19C228 0029C128 50545F44 */ .word 0x445F5450
/* 19C22C 0029C12C 5241575F */ .word 0x5F574152
/* 19C230 0029C130 464C4147 */ .word 0x47414C46
/* 19C234 0029C134 00000000 */ .word 0x00000000
