.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2962
/* 19D528 0029D428 66697368 */ .word 0x68736966
/* 19D52C 0029D42C 696E672E */ .word 0x2E676E69
/* 19D530 0029D430 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19D534 0029D434 00000000 */ .word 0x00000000
