.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_265
/* 199D98 00299C98 6B616E62 */ .word 0x626E616B
/* 199D9C 00299C9C 616E0000 */ .word 0x00006E61
