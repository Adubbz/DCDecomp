.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_956
/* 19DF00 0029DE00 6B676574 */ .word 0x7465676B
/* 19DF04 0029DE04 6F616E00 */ .word GlobalDataBuffer + 0x43B0EF
