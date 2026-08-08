.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2808
/* 19AFD0 0029AED0 65303174 */ .word 0x74313065
/* 19AFD4 0029AED4 30322E69 */ .word 0x692E3230
/* 19AFD8 0029AED8 6D670000 */ .word 0x0000676D
/* 19AFDC 0029AEDC 00000000 */ .word 0x00000000
