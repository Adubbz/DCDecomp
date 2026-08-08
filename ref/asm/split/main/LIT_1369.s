.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1369
/* 19B430 0029B330 63706F6C */ .word 0x6C6F7063
/* 19B434 0029B334 79206F76 */ .word 0x766F2079
/* 19B438 0029B338 65722121 */ .word 0x21217265
/* 19B43C 0029B33C 21212025 */ .word 0x25202121
/* 19B440 0029B340 640A0000 */ .word 0x00000A64
/* 19B444 0029B344 00000000 */ .word 0x00000000
