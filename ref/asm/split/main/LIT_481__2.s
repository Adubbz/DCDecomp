.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_481__2
/* 19F6E0 0029F5E0 77696E64 */ .word 0x646E6977
/* 19F6E4 0029F5E4 6F770000 */ .word 0x0000776F
/* 19F6E8 0029F5E8 00000000 */ .word 0x00000000
/* 19F6EC 0029F5EC 00000000 */ .word 0x00000000
