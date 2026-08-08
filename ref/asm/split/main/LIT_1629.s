.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1629
/* 19BBB8 0029BAB8 4576656E */ .word 0x6E657645
/* 19BBBC 0029BABC 74494420 */ .word 0x20444974
/* 19BBC0 0029BAC0 3D202564 */ .word 0x6425203D
/* 19BBC4 0029BAC4 0A000000 */ .word 0x0000000A
