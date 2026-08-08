.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1082__2
/* 19B410 0029B310 77617465 */ .word 0x65746177
/* 19B414 0029B314 725F6275 */ .word 0x75625F72
/* 19B418 0029B318 66660000 */ .word 0x00006666
/* 19B41C 0029B31C 00000000 */ .word 0x00000000
