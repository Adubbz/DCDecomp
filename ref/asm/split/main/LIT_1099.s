.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1099
/* 19F570 0029F470 735F6272 */ .word 0x72625F73
/* 19F574 0029F474 65616B00 */ .word GlobalDataBuffer + 0x40B0E5
