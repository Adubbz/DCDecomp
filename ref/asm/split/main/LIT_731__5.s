.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_731__5
/* 19CF48 0029CE48 6B6F7579 */ .word 0x79756F6B
/* 19CF4C 0029CE4C 616B7500 */ .word GlobalDataBuffer + 0x4ABAE1
