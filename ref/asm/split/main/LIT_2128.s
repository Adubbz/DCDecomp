.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2128
/* 19D3E8 0029D2E8 70333161 */ .word 0x61313370
/* 19D3EC 0029D2EC 00000000 */ .word 0x00000000
