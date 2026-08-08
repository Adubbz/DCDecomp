.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2364
/* 19AD60 0029AC60 6E000000 */ .word 0x0000006E
/* 19AD64 0029AC64 00000000 */ .word 0x00000000
