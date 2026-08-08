.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2809
/* 19AFE0 0029AEE0 63757273 */ .word 0x73727563
/* 19AFE4 0029AEE4 6F722E69 */ .word 0x692E726F
/* 19AFE8 0029AEE8 6D670000 */ .word 0x0000676D
/* 19AFEC 0029AEEC 00000000 */ .word 0x00000000
