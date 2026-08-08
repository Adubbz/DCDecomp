.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_595__2
/* 19C850 0029C750 61746669 */ .word 0x69667461
/* 19C854 0029C754 72650000 */ .word 0x00006572
