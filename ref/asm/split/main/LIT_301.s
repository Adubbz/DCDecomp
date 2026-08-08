.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_301
/* 199F18 00299E18 6D697A75 */ .word 0x757A696D
/* 199F1C 00299E1C 00000000 */ .word 0x00000000
