.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_34
/* 19F8E0 0029F7E0 4D6F6475 */ .word 0x75646F4D
/* 19F8E4 0029F7E4 6C6F2062 */ .word 0x62206F6C
/* 19F8E8 0029F7E8 79203000 */ .word GlobalDataBuffer + 0x56FF9
/* 19F8EC 0029F7EC 00000000 */ .word 0x00000000
