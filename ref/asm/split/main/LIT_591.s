.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_591
/* 19A8F8 0029A7F8 2573312E */ .word 0x2E317325
/* 19A8FC 0029A7FC 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
