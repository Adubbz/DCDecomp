.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_608
/* 19A268 0029A168 626C656E */ .word 0x6E656C62
/* 19A26C 0029A16C 64657200 */ .word GlobalDataBuffer + 0x47B4E4
