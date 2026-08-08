.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_928__3
/* 19D618 0029D518 77657069 */ .word 0x69706577
/* 19D61C 0029D51C 636F6E00 */ .word GlobalDataBuffer + 0x43BEE3
