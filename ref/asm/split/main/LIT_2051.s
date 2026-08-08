.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2051
/* 19F1F0 0029F0F0 676F6C64 */ .word 0x646C6F67
/* 19F1F4 0029F0F4 20202020 */ .word 0x20202020
/* 19F1F8 0029F0F8 203A2564 */ .word 0x64253A20
/* 19F1FC 0029F0FC 0A000000 */ .word 0x0000000A
