.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_828
/* 19ABD0 0029AAD0 3E000000 */ .word 0x0000003E
/* 19ABD4 0029AAD4 00000000 */ .word 0x00000000
