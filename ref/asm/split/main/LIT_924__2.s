.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_924__2
/* 19D5E8 0029D4E8 6672616D */ .word 0x6D617266
/* 19D5EC 0029D4EC 655F696D */ .word 0x6D695F65
/* 19D5F0 0029D4F0 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19D5F4 0029D4F4 00000000 */ .word 0x00000000
