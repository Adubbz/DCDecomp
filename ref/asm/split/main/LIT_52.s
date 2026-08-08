.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_52
/* 19F900 0029F800 25660000 */ .word 0x00006625
/* 19F904 0029F804 00000000 */ .word 0x00000000
/* 19F908 0029F808 00000000 */ .word 0x00000000
/* 19F90C 0029F80C 00000000 */ .word 0x00000000
