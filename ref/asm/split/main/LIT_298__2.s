.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_298__2
/* 199EF0 00299DF0 726F7531 */ .word 0x31756F72
/* 199EF4 00299DF4 202D6B61 */ .word 0x616B2D20
/* 199EF8 00299DF8 62653100 */ .word GlobalDataBuffer + 0x6B4E2
/* 199EFC 00299DFC 00000000 */ .word 0x00000000
