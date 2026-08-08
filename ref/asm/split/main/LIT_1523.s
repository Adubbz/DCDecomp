.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1523
/* 19B830 0029B730 434F4C4C */ .word 0x4C4C4F43
/* 19B834 0029B734 4953494F */ .word 0x4F495349
/* 19B838 0029B738 4E202020 */ .word 0x2020204E
/* 19B83C 0029B73C 2020203D */ .word 0x3D202020
/* 19B840 0029B740 2025730A */ .word 0x0A732520
/* 19B844 0029B744 00000000 */ .word 0x00000000
/* 19B848 0029B748 00000000 */ .word 0x00000000
/* 19B84C 0029B74C 00000000 */ .word 0x00000000
