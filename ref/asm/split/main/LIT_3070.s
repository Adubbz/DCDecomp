.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3070
/* 19EDA8 0029ECA8 68697261 */ .word 0x61726968
/* 19EDAC 0029ECAC 00000000 */ .word 0x00000000
