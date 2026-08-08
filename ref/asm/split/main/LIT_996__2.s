.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_996__2
/* 19DFC0 0029DEC0 63313000 */ .word GlobalDataBuffer + 0x580E3
/* 19DFC4 0029DEC4 00000000 */ .word 0x00000000
