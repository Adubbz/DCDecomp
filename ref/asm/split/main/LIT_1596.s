.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1596
/* 19B4A0 0029B3A0 50524F4A */ .word 0x4A4F5250
/* 19B4A4 0029B3A4 45435449 */ .word 0x49544345
/* 19B4A8 0029B3A8 4F4E0000 */ .word 0x00004E4F
/* 19B4AC 0029B3AC 00000000 */ .word 0x00000000
