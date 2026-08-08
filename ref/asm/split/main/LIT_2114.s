.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2114
/* 19D390 0029D290 70333200 */ .word GlobalDataBuffer + 0x782F0
/* 19D394 0029D294 00000000 */ .word 0x00000000
