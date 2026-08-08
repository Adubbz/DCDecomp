.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_310
/* 199F70 00299E70 6B6F6D6F */ .word 0x6F6D6F6B
/* 199F74 00299E74 6E6F0000 */ .word 0x00006F6E
