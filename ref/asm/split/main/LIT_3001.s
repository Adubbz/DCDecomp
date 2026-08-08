.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3001
/* 19B0F0 0029AFF0 67656469 */ .word 0x69646567
/* 19B0F4 0029AFF4 742F6530 */ .word 0x30652F74
/* 19B0F8 0029AFF8 312F6D64 */ .word 0x646D2F31
/* 19B0FC 0029AFFC 732F6530 */ .word 0x30652F73
/* 19B100 0029B000 31613034 */ .word 0x34306131
/* 19B104 0029B004 5F302E6D */ .word 0x6D2E305F
/* 19B108 0029B008 64730000 */ .word 0x00007364
/* 19B10C 0029B00C 00000000 */ .word 0x00000000
