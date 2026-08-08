.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1532
/* 19B950 0029B850 4556454E */ .word 0x4E455645
/* 19B954 0029B854 54205445 */ .word 0x45542054
/* 19B958 0029B858 53542020 */ .word 0x20205453
/* 19B95C 0029B85C 2020203D */ .word 0x3D202020
/* 19B960 0029B860 2025640A */ .word 0x0A642520
/* 19B964 0029B864 00000000 */ .word 0x00000000
/* 19B968 0029B868 00000000 */ .word 0x00000000
/* 19B96C 0029B86C 00000000 */ .word 0x00000000
