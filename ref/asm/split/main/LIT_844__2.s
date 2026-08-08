.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_844__2
/* 19F4A8 0029F3A8 6D656E75 */ .word 0x756E656D
/* 19F4AC 0029F3AC 5F65782E */ .word 0x2E78655F
/* 19F4B0 0029F3B0 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19F4B4 0029F3B4 00000000 */ .word 0x00000000
