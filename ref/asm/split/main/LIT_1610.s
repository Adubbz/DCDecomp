.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1610
/* 19ABE0 0029AAE0 6672616D */ .word 0x6D617266
/* 19ABE4 0029AAE4 655F696D */ .word 0x6D695F65
/* 19ABE8 0029AAE8 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19ABEC 0029AAEC 00000000 */ .word 0x00000000
