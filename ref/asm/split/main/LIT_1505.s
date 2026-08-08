.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1505
/* 19F7C8 0029F6C8 6F70656E */ .word 0x6E65706F
/* 19F7CC 0029F6CC 626F6F6B */ .word 0x6B6F6F62
/* 19F7D0 0029F6D0 2E70616B */ .word 0x6B61702E
/* 19F7D4 0029F6D4 00000000 */ .word 0x00000000
/* 19F7D8 0029F6D8 00000000 */ .word 0x00000000
/* 19F7DC 0029F6DC 00000000 */ .word 0x00000000
