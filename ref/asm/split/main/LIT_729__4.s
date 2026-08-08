.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_729__4
/* 19CF28 0029CE28 6B657968 */ .word 0x6879656B
/* 19CF2C 0029CE2C 6F6E6F6F */ .word 0x6F6F6E6F
/* 19CF30 0029CE30 00000000 */ .word 0x00000000
/* 19CF34 0029CE34 00000000 */ .word 0x00000000
