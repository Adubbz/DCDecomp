.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1627__2
/* 19B520 0029B420 696E2F00 */ .word GlobalDataBuffer + 0x4BDE9
/* 19B524 0029B424 00000000 */ .word 0x00000000
