.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_764__3
/* 19F298 0029F198 6672616D */ .word 0x6D617266
/* 19F29C 0029F19C 655F696D */ .word 0x6D695F65
/* 19F2A0 0029F1A0 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19F2A4 0029F1A4 00000000 */ .word 0x00000000
