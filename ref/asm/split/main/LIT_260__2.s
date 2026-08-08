.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_260__2
/* 19A1C8 0029A0C8 626C656E */ .word 0x6E656C62
/* 19A1CC 0029A0CC 64657200 */ .word GlobalDataBuffer + 0x47B4E4
