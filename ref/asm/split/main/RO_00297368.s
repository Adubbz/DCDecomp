.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297368
/* 197468 00297368 73636543 */ .word 0x43656373
/* 19746C 0029736C 64537453 */ .word 0x53745364
/* 197470 00297370 74617420 */ .word 0x20746174
/* 197474 00297374 63616C6C */ .word 0x6C6C6163
/* 197478 00297378 0A000000 */ .word 0x0000000A
/* 19747C 0029737C 00000000 */ .word 0x00000000
