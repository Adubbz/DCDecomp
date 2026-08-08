.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_289
/* 199CE0 00299BE0 5343456C */ .word 0x6C454353
/* 199CE4 00299BE4 6F676F00 */ .word GlobalDataBuffer + 0x44B6EF
