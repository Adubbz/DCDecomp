.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_666__2
/* 19CC10 0029CB10 6B6F6E61 */ .word 0x616E6F6B
/* 19CC14 0029CB14 72657065 */ .word 0x65706572
/* 19CC18 0029CB18 00000000 */ .word 0x00000000
/* 19CC1C 0029CB1C 00000000 */ .word 0x00000000
