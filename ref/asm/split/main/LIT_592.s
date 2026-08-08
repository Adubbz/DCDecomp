.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_592
/* 19A900 0029A800 2573322E */ .word 0x2E327325
/* 19A904 0029A804 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
