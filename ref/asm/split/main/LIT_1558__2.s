.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1558__2
/* 19F7F8 0029F6F8 6F70656E */ .word 0x6E65706F
/* 19F7FC 0029F6FC 7465782E */ .word 0x2E786574
/* 19F800 0029F700 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19F804 0029F704 00000000 */ .word 0x00000000
