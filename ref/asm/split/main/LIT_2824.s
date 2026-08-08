.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2824
/* 19EC90 0029EB90 6E6F7420 */ .word 0x20746F6E
/* 19EC94 0029EB94 0A000000 */ .word 0x0000000A
/* 19EC98 0029EB98 00000000 */ .word 0x00000000
/* 19EC9C 0029EB9C 00000000 */ .word 0x00000000
