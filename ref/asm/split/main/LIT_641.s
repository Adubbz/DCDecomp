.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_641
/* 19C698 0029C598 64636F6C */ .word 0x6C6F6364
/* 19C69C 0029C59C 31000000 */ .word 0x00000031
