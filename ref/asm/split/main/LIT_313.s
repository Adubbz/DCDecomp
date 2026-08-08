.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_313
/* 199F88 00299E88 31000000 */ .word 0x00000031
/* 199F8C 00299E8C 00000000 */ .word 0x00000000
