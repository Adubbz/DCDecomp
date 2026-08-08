.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_734
/* 1990B0 00298FB0 434C4F54 */ .word 0x544F4C43
/* 1990B4 00298FB4 48000000 */ .word 0x00000048
