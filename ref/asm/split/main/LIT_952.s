.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_952
/* 19DEF8 0029DDF8 31380000 */ .word 0x00003831
/* 19DEFC 0029DDFC 00000000 */ .word 0x00000000
