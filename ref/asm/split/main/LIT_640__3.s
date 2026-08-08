.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_640__3
/* 19CAB8 0029C9B8 70616E00 */ .word GlobalDataBuffer + 0x43B0F0
/* 19CABC 0029C9BC 00000000 */ .word 0x00000000
