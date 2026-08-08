.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_314
/* 199F90 00299E90 32000000 */ .word 0x00000032
/* 199F94 00299E94 00000000 */ .word 0x00000000
