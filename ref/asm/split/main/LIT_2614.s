.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2614
/* 19B368 0029B268 6672616D */ .word 0x6D617266
/* 19B36C 0029B26C 655F696D */ .word 0x6D695F65
/* 19B370 0029B270 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19B374 0029B274 00000000 */ .word 0x00000000
