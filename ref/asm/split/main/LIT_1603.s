.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1603
/* 19B4E8 0029B3E8 44454255 */ .word 0x55424544
/* 19B4EC 0029B3EC 47000000 */ .word 0x00000047
