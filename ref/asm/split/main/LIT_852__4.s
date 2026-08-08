.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_852__4
/* 19F2A8 0029F1A8 77657069 */ .word 0x69706577
/* 19F2AC 0029F1AC 636F6E00 */ .word GlobalDataBuffer + 0x43BEE3
