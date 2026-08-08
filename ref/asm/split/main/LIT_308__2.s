.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_308__2
/* 199F60 00299E60 6B6F7961 */ .word 0x61796F6B
/* 199F64 00299E64 42000000 */ .word 0x00000042
