.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_420
/* 19B380 0029B280 6D657320 */ .word 0x2073656D
/* 19B384 0029B284 3D202573 */ .word 0x7325203D
/* 19B388 0029B288 0A000000 */ .word 0x0000000A
/* 19B38C 0029B28C 00000000 */ .word 0x00000000
