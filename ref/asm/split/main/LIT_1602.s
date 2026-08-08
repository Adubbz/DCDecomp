.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1602
/* 19B4E0 0029B3E0 42524947 */ .word 0x47495242
/* 19B4E4 0029B3E4 48540000 */ .word 0x00005448
