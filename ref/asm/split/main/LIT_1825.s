.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1825
/* 19BBE8 0029BAE8 74726170 */ .word 0x70617274
/* 19BBEC 0029BAEC 206E756D */ .word 0x6D756E20
/* 19BBF0 0029BAF0 203D2025 */ .word 0x25203D20
/* 19BBF4 0029BAF4 640A0000 */ .word 0x00000A64
