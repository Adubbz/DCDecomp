.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2096
/* 199C98 00299B98 6761696A */ .word 0x6A696167
/* 199C9C 00299B9C 69000000 */ .word 0x00000069
