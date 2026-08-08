.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3002
/* 19B110 0029B010 67656469 */ .word 0x69646567
/* 19B114 0029B014 742F6530 */ .word 0x30652F74
/* 19B118 0029B018 312F6D64 */ .word 0x646D2F31
/* 19B11C 0029B01C 732F6530 */ .word 0x30652F73
/* 19B120 0029B020 31613035 */ .word 0x35306131
/* 19B124 0029B024 5F302E6D */ .word 0x6D2E305F
/* 19B128 0029B028 64730000 */ .word 0x00007364
/* 19B12C 0029B02C 00000000 */ .word 0x00000000
