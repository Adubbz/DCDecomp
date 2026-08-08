.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3549
/* 19EEA8 0029EDA8 66697368 */ .word 0x68736966
/* 19EEAC 0029EDAC 6D6E752E */ .word 0x2E756E6D
/* 19EEB0 0029EDB0 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19EEB4 0029EDB4 00000000 */ .word 0x00000000
