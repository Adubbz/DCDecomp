.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_735
/* 1990B8 00298FB8 424F4459 */ .word 0x59444F42
/* 1990BC 00298FBC 5F53495A */ .word 0x5A49535F
/* 1990C0 00298FC0 45000000 */ .word 0x00000045
/* 1990C4 00298FC4 00000000 */ .word 0x00000000
