.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_305
/* 199F48 00299E48 33660000 */ .word 0x00006633
/* 199F4C 00299E4C 00000000 */ .word 0x00000000
