.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2119
/* 19D3B8 0029D2B8 70353500 */ .word GlobalDataBuffer + 0xA84F0
/* 19D3BC 0029D2BC 00000000 */ .word 0x00000000
