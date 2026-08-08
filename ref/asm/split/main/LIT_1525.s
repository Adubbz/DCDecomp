.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1525
/* 19B870 0029B770 50415241 */ .word 0x41524150
/* 19B874 0029B774 4D455445 */ .word 0x4554454D
/* 19B878 0029B778 52202020 */ .word 0x20202052
/* 19B87C 0029B77C 2020203D */ .word 0x3D202020
/* 19B880 0029B780 2025730A */ .word 0x0A732520
/* 19B884 0029B784 00000000 */ .word 0x00000000
/* 19B888 0029B788 00000000 */ .word 0x00000000
/* 19B88C 0029B78C 00000000 */ .word 0x00000000
