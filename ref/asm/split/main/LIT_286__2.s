.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_286__2
/* 199E70 00299D70 63617231 */ .word 0x31726163
/* 199E74 00299D74 00000000 */ .word 0x00000000
