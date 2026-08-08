.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_193
/* 1992B8 002991B8 47524156 */ .word 0x56415247
/* 1992BC 002991BC 49545900 */ .word GlobalDataBuffer + 0x2EA3C9
