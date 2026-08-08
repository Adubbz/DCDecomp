.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2132
/* 19D408 0029D308 63303363 */ .word 0x63333063
/* 19D40C 0029D30C 00000000 */ .word 0x00000000
