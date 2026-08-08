.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_464__3
/* 19E3F8 0029E2F8 656D656E */ .word 0x6E656D65
/* 19E3FC 0029E2FC 752E7061 */ .word 0x61702E75
/* 19E400 0029E300 6B000000 */ .word 0x0000006B
/* 19E404 0029E304 00000000 */ .word 0x00000000
