.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_322
/* 199FD0 00299ED0 74650000 */ .word 0x00006574
/* 199FD4 00299ED4 00000000 */ .word 0x00000000
