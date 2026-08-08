.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1169__2
/* 19CFB8 0029CEB8 626F6D62 */ .word 0x626D6F62
/* 19CFBC 0029CEBC 5F657800 */ .word GlobalDataBuffer + 0x4DB4DF
