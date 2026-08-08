.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_891__2
/* 19B3D0 0029B2D0 6672616D */ .word 0x6D617266
/* 19B3D4 0029B2D4 655F696D */ .word 0x6D695F65
/* 19B3D8 0029B2D8 61676500 */ .word GlobalDataBuffer + 0x3AB6E1
/* 19B3DC 0029B2DC 00000000 */ .word 0x00000000
