.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_946
/* 19BD50 0029BC50 2E636872 */ .word 0x7268632E
/* 19BD54 0029BC54 00000000 */ .word 0x00000000
