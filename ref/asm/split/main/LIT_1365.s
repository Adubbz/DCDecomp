.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1365
/* 19B750 0029B650 69626F78 */ .word 0x786F6269
/* 19B754 0029B654 735F612E */ .word 0x2E615F73
/* 19B758 0029B658 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
/* 19B75C 0029B65C 00000000 */ .word 0x00000000
