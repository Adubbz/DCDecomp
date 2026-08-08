.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_951
/* 19DEF0 0029DDF0 31300000 */ .word 0x00003031
/* 19DEF4 0029DDF4 00000000 */ .word 0x00000000
