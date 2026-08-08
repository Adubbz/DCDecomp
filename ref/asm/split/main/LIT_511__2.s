.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_511__2
/* 19C208 0029C108 4452414E */ .word 0x4E415244
/* 19C20C 0029C10C 535F5041 */ .word 0x41505F53
/* 19C210 0029C110 52545300 */ .word GlobalDataBuffer + 0x28A3D2
/* 19C214 0029C114 00000000 */ .word 0x00000000
