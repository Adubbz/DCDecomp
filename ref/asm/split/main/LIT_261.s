.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_261
/* 199D78 00299C78 68616B6F */ .word 0x6F6B6168
/* 199D7C 00299C7C 00000000 */ .word 0x00000000
