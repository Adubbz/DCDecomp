.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_894__3
/* 19E598 0029E498 6672616D */ .word 0x6D617266
/* 19E59C 0029E49C 655F696D */ .word 0x6D695F65
/* 19E5A0 0029E4A0 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19E5A4 0029E4A4 00000000 */ .word 0x00000000
/* 19E5A8 0029E4A8 00000000 */ .word 0x00000000
/* 19E5AC 0029E4AC 00000000 */ .word 0x00000000
