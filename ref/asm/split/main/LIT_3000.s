.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3000
/* 19B0D0 0029AFD0 67656469 */ .word 0x69646567
/* 19B0D4 0029AFD4 742F6530 */ .word 0x30652F74
/* 19B0D8 0029AFD8 312F6D64 */ .word 0x646D2F31
/* 19B0DC 0029AFDC 732F6530 */ .word 0x30652F73
/* 19B0E0 0029AFE0 31613033 */ .word 0x33306131
/* 19B0E4 0029AFE4 5F302E6D */ .word 0x6D2E305F
/* 19B0E8 0029AFE8 64730000 */ .word 0x00007364
/* 19B0EC 0029AFEC 00000000 */ .word 0x00000000
