.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_331__3
/* 19A680 0029A580 534B5900 */ .word GlobalDataBuffer + 0x2E9AD3
/* 19A684 0029A584 00000000 */ .word 0x00000000
