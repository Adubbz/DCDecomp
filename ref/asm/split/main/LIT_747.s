.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_747
/* 19C770 0029C670 62617365 */ .word 0x65736162
/* 19C774 0029C674 322E6366 */ .word 0x66632E32
/* 19C778 0029C678 67000000 */ .word 0x00000067
/* 19C77C 0029C67C 00000000 */ .word 0x00000000
