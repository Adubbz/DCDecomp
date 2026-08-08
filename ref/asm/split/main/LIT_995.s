.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_995
/* 19DFB8 0029DEB8 63303500 */ .word GlobalDataBuffer + 0xA7FE3
/* 19DFBC 0029DEBC 00000000 */ .word 0x00000000
