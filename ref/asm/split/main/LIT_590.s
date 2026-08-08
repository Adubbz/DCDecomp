.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_590
/* 19A8F0 0029A7F0 2573302E */ .word 0x2E307325
/* 19A8F4 0029A7F4 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
