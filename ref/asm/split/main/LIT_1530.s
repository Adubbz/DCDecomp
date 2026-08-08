.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1530
/* 19B910 0029B810 4C696768 */ .word 0x6867694C
/* 19B914 0029B814 74204D6F */ .word 0x6F4D2074
/* 19B918 0029B818 64652020 */ .word 0x20206564
/* 19B91C 0029B81C 2020203D */ .word 0x3D202020
/* 19B920 0029B820 2025730A */ .word 0x0A732520
/* 19B924 0029B824 00000000 */ .word 0x00000000
/* 19B928 0029B828 00000000 */ .word 0x00000000
/* 19B92C 0029B82C 00000000 */ .word 0x00000000
