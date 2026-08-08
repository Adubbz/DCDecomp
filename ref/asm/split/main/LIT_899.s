.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_899
/* 19B5E0 0029B4E0 64756E2F */ .word 0x2F6E7564
/* 19B5E4 0029B4E4 65666665 */ .word 0x65666665
/* 19B5E8 0029B4E8 63742F25 */ .word 0x252F7463
/* 19B5EC 0029B4EC 732E6368 */ .word 0x68632E73
/* 19B5F0 0029B4F0 72000000 */ .word 0x00000072
/* 19B5F4 0029B4F4 00000000 */ .word 0x00000000
