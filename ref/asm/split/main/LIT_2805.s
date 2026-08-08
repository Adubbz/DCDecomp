.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2805
/* 19AF88 0029AE88 66756B69 */ .word 0x696B7566
/* 19AF8C 0029AE8C 3235362E */ .word 0x2E363532
/* 19AF90 0029AE90 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19AF94 0029AE94 00000000 */ .word 0x00000000
