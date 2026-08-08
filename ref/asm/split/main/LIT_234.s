.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_234
/* 199178 00299078 61646472 */ .word 0x72646461
/* 19917C 0029907C 65737320 */ .word 0x20737365
/* 199180 00299080 6572726F */ .word 0x6F727265
/* 199184 00299084 720A0000 */ .word 0x00000A72
/* 199188 00299088 00000000 */ .word 0x00000000
/* 19918C 0029908C 00000000 */ .word 0x00000000
