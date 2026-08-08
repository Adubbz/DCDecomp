.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_79
/* 19F940 0029F840 6E6F7420 */ .word 0x20746F6E
/* 19F944 0029F844 666F756E */ .word 0x6E756F66
/* 19F948 0029F848 64206578 */ .word 0x78652064
/* 19F94C 0029F84C 74202564 */ .word 0x64252074
/* 19F950 0029F850 0A000000 */ .word 0x0000000A
/* 19F954 0029F854 00000000 */ .word 0x00000000
/* 19F958 0029F858 00000000 */ .word 0x00000000
/* 19F95C 0029F85C 00000000 */ .word 0x00000000
