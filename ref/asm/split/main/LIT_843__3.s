.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_843__3
/* 19F498 0029F398 6275696C */ .word 0x6C697562
/* 19F49C 0029F39C 6475702E */ .word 0x2E707564
/* 19F4A0 0029F3A0 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19F4A4 0029F3A4 00000000 */ .word 0x00000000
