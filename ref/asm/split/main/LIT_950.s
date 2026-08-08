.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_950
/* 19DEE8 0029DDE8 30350000 */ .word 0x00003530
/* 19DEEC 0029DDEC 00000000 */ .word 0x00000000
