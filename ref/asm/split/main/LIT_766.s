.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_766
/* 19A220 0029A120 6672616D */ .word 0x6D617266
/* 19A224 0029A124 655F696D */ .word 0x6D695F65
/* 19A228 0029A128 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19A22C 0029A12C 00000000 */ .word 0x00000000
