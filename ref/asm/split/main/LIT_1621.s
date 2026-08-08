.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1621
/* 19BAF0 0029B9F0 63726566 */ .word 0x66657263
/* 19BAF4 0029B9F4 20252E32 */ .word 0x322E2520
/* 19BAF8 0029B9F8 662F2025 */ .word 0x25202F66
/* 19BAFC 0029B9FC 2E32662F */ .word 0x2F66322E
/* 19BB00 0029BA00 20252E32 */ .word 0x322E2520
/* 19BB04 0029BA04 660A0000 */ .word 0x00000A66
/* 19BB08 0029BA08 00000000 */ .word 0x00000000
/* 19BB0C 0029BA0C 00000000 */ .word 0x00000000
