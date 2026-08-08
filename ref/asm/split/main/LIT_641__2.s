.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_641__2
/* 19CAC0 0029C9C0 63686963 */ .word 0x63696863
/* 19CAC4 0029C9C4 6B656E00 */ .word GlobalDataBuffer + 0x43B4EB
