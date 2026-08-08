.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2999
/* 19B0C8 0029AFC8 6D64732E */ .word 0x2E73646D
/* 19B0CC 0029AFCC 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
