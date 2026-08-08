.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_994
/* 19DFB0 0029DEB0 63303600 */ .word GlobalDataBuffer + 0xB7FE3
/* 19DFB4 0029DEB4 00000000 */ .word 0x00000000
