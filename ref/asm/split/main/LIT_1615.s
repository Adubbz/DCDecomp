.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1615
/* 19BA50 0029B950 202D2D2D */ .word 0x2D2D2D20
/* 19BA54 0029B954 496E666F */ .word 0x6F666E49
/* 19BA58 0029B958 6D617469 */ .word 0x6974616D
/* 19BA5C 0029B95C 6F6E2D2D */ .word 0x2D2D6E6F
/* 19BA60 0029B960 2D0A0000 */ .word 0x00000A2D
/* 19BA64 0029B964 00000000 */ .word 0x00000000
/* 19BA68 0029B968 00000000 */ .word 0x00000000
/* 19BA6C 0029B96C 00000000 */ .word 0x00000000
