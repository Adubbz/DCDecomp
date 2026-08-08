.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_422
/* 19B3A0 0029B2A0 67656469 */ .word 0x69646567
/* 19B3A4 0029B2A4 742F7379 */ .word 0x79732F74
/* 19B3A8 0029B2A8 7374656D */ .word 0x6D657473
/* 19B3AC 0029B2AC 2F657665 */ .word 0x6576652F
/* 19B3B0 0029B2B0 6E742E73 */ .word 0x732E746E
/* 19B3B4 0029B2B4 74620000 */ .word 0x00006274
