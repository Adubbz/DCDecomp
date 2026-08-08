.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_589
/* 19A8E8 0029A7E8 25730000 */ .word 0x00007325
/* 19A8EC 0029A7EC 00000000 */ .word 0x00000000
