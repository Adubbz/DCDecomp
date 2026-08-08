.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1194
/* 19B420 0029B320 25662025 */ .word 0x25206625
/* 19B424 0029B324 66202566 */ .word 0x66252066
/* 19B428 0029B328 0A000000 */ .word 0x0000000A
/* 19B42C 0029B32C 00000000 */ .word 0x00000000
