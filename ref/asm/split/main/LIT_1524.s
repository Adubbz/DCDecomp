.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1524
/* 19B850 0029B750 42474D20 */ .word 0x204D4742
/* 19B854 0029B754 504C4159 */ .word 0x59414C50
/* 19B858 0029B758 20202020 */ .word 0x20202020
/* 19B85C 0029B75C 2020203D */ .word 0x3D202020
/* 19B860 0029B760 2025730A */ .word 0x0A732520
/* 19B864 0029B764 00000000 */ .word 0x00000000
/* 19B868 0029B768 00000000 */ .word 0x00000000
/* 19B86C 0029B76C 00000000 */ .word 0x00000000
