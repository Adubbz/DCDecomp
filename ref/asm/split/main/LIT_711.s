.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_711
/* 19CE40 0029CD40 7975756B */ .word 0x6B757579
/* 19CE44 0029CD44 69697461 */ .word 0x61746969
/* 19CE48 0029CD48 00000000 */ .word 0x00000000
/* 19CE4C 0029CD4C 00000000 */ .word 0x00000000
