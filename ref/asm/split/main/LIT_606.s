.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_606
/* 19A250 0029A150 726F7573 */ .word 0x73756F72
/* 19A254 0029A154 6F6B7500 */ .word GlobalDataBuffer + 0x4ABAEF
