.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_642__2
/* 19C6A0 0029C5A0 6974656D */ .word 0x6D657469
/* 19C6A4 0029C5A4 6C73742E */ .word 0x2E74736C
/* 19C6A8 0029C5A8 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19C6AC 0029C5AC 00000000 */ .word 0x00000000
