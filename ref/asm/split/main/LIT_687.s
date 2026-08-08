.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_687
/* 19B150 0029B050 6D000000 */ .word 0x0000006D
/* 19B154 0029B054 00000000 */ .word 0x00000000
