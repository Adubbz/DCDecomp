.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2130
/* 19D3F8 0029D2F8 70353461 */ .word 0x61343570
/* 19D3FC 0029D2FC 00000000 */ .word 0x00000000
