.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_15
/* 19F870 0029F770 52554E54 */ .word 0x544E5552
/* 19F874 0029F774 494D4520 */ .word 0x20454D49
/* 19F878 0029F778 4552524F */ .word 0x4F525245
/* 19F87C 0029F77C 523A2025 */ .word 0x25203A52
/* 19F880 0029F780 730A0000 */ .word 0x00000A73
/* 19F884 0029F784 00000000 */ .word 0x00000000
