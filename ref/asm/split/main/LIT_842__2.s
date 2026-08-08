.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_842__2
/* 19F488 0029F388 735F6272 */ .word 0x72625F73
/* 19F48C 0029F38C 65616B2E */ .word 0x2E6B6165
/* 19F490 0029F390 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
/* 19F494 0029F394 00000000 */ .word 0x00000000
