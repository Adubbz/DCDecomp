.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1502
/* 19EB68 0029EA68 6672616D */ .word 0x6D617266
/* 19EB6C 0029EA6C 655F696D */ .word 0x6D695F65
/* 19EB70 0029EA70 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19EB74 0029EA74 00000000 */ .word 0x00000000
/* 19EB78 0029EA78 00000000 */ .word 0x00000000
/* 19EB7C 0029EA7C 00000000 */ .word 0x00000000
