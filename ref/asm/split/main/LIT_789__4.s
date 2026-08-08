.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_789__4
/* 19F780 0029F680 6672616D */ .word 0x6D617266
/* 19F784 0029F684 655F696D */ .word 0x6D695F65
/* 19F788 0029F688 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19F78C 0029F68C 00000000 */ .word 0x00000000
