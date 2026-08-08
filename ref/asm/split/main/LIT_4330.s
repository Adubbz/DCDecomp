.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_4330
/* 19DB70 0029DA70 77657063 */ .word 0x63706577
/* 19DB74 0029DA74 68617261 */ .word 0x61726168
/* 19DB78 0029DA78 2E696D67 */ .word 0x676D692E
/* 19DB7C 0029DA7C 00000000 */ .word 0x00000000
