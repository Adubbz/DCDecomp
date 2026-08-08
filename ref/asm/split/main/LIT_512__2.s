.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_512__2
/* 19C218 0029C118 4452414E */ .word 0x4E415244
/* 19C21C 0029C11C 535F434F */ .word 0x4F435F53
/* 19C220 0029C120 4C530000 */ .word 0x0000534C
/* 19C224 0029C124 00000000 */ .word 0x00000000
