.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_194
/* 1992C0 002991C0 504F4C59 */ .word 0x594C4F50
/* 1992C4 002991C4 44495600 */ .word GlobalDataBuffer + 0x2B98C4
