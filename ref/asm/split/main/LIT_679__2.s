.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_679__2
/* 19CCA8 0029CBA8 73617665 */ .word 0x65766173
/* 19CCAC 0029CBAC 73796F00 */ .word GlobalDataBuffer + 0x44C8F3
