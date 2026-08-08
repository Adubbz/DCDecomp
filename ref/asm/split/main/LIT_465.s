.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_465
/* 199940 00299840 65000000 */ .word 0x00000065
/* 199944 00299844 00000000 */ .word 0x00000000
