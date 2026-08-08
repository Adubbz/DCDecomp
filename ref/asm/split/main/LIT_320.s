.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_320
/* 199FC0 00299EC0 7A6F7500 */ .word GlobalDataBuffer + 0x4ABEFA
/* 199FC4 00299EC4 00000000 */ .word 0x00000000
