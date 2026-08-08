.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1370
/* 19B7D0 0029B6D0 4D6F6E73 */ .word 0x736E6F4D
/* 19B7D4 0029B6D4 746F7244 */ .word 0x44726F74
/* 19B7D8 0029B6D8 61746120 */ .word 0x20617461
/* 19B7DC 0029B6DC 20202020 */ .word 0x20202020
/* 19B7E0 0029B6E0 5B25785D */ .word 0x5D78255B
/* 19B7E4 0029B6E4 20202564 */ .word 0x64252020
/* 19B7E8 0029B6E8 2F25640A */ .word 0x0A64252F
/* 19B7EC 0029B6EC 00000000 */ .word 0x00000000
