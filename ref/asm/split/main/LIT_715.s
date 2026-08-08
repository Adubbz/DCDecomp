.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_715
/* 19AA50 0029A950 73302564 */ .word 0x64253073
/* 19AA54 0029A954 00000000 */ .word 0x00000000
