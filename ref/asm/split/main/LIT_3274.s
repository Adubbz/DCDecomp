.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3274
/* 19D578 0029D478 66697368 */ .word 0x68736966
/* 19D57C 0029D47C 7265632E */ .word 0x2E636572
/* 19D580 0029D480 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19D584 0029D484 00000000 */ .word 0x00000000
