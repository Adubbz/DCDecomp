.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_598
/* 19C870 0029C770 61747769 */ .word 0x69777461
/* 19C874 0029C774 6E640000 */ .word 0x0000646E
