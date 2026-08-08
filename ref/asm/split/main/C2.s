.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel C2
/* 1988A0 002987A0 7751C116 */ .word 0x16C15177
/* 1988A4 002987A4 6CC156BF */ .word 0xBF56C16C
