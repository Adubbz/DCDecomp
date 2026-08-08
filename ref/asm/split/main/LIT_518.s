.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_518
/* 19C278 0029C178 5552415F */ .word 0x5F415255
/* 19C27C 0029C17C 464F4700 */ .word GlobalDataBuffer + 0x1C9EC6
