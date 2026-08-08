.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_668
/* 19CC30 0029CB30 706F636B */ .word 0x6B636F70
/* 19CC34 0029CB34 65740000 */ .word 0x00007465
