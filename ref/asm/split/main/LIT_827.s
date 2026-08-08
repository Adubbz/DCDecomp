.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_827
/* 19ABC8 0029AAC8 20000000 */ .word 0x00000020
/* 19ABCC 0029AACC 00000000 */ .word 0x00000000
