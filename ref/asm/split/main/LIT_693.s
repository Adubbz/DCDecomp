.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_693
/* 19CD58 0029CC58 6B657974 */ .word 0x7479656B
/* 19CD5C 0029CC5C 756E6F00 */ .word GlobalDataBuffer + 0x44BDF5
