.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_712
/* 19CE50 0029CD50 70617461 */ .word 0x61746170
/* 19CE54 0029CD54 70617461 */ .word 0x61746170
/* 19CE58 0029CD58 00000000 */ .word 0x00000000
/* 19CE5C 0029CD5C 00000000 */ .word 0x00000000
