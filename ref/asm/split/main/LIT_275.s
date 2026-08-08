.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_275
/* 199DF8 00299CF8 79616E65 */ .word 0x656E6179
/* 199DFC 00299CFC 00000000 */ .word 0x00000000
