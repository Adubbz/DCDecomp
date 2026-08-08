.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3094
/* 19EDE0 0029ECE0 73617665 */ .word 0x65766173
/* 19EDE4 0029ECE4 696D672E */ .word 0x2E676D69
/* 19EDE8 0029ECE8 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19EDEC 0029ECEC 00000000 */ .word 0x00000000
