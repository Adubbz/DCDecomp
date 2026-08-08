.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_930__2
/* 19BD30 0029BC30 6D647320 */ .word 0x2073646D
/* 19BD34 0029BC34 3D202573 */ .word 0x7325203D
/* 19BD38 0029BC38 0A000000 */ .word 0x0000000A
/* 19BD3C 0029BC3C 00000000 */ .word 0x00000000
