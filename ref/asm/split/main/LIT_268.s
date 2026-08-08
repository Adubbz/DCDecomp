.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_268
/* 199DB0 00299CB0 7461696D */ .word 0x6D696174
/* 199DB4 00299CB4 61747500 */ .word GlobalDataBuffer + 0x4AC3E1
