.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_809__2
/* 19C3A8 0029C2A8 74657861 */ .word 0x61786574
/* 19C3AC 0029C2AC 6E696D65 */ .word 0x656D696E
/* 19C3B0 0029C2B0 2E636667 */ .word 0x6766632E
/* 19C3B4 0029C2B4 00000000 */ .word 0x00000000
