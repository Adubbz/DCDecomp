.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_630__4
/* 19CA20 0029C920 6D61796F */ .word 0x6F79616D
/* 19CA24 0029C924 6B65646B */ .word 0x6B64656B
/* 19CA28 0029C928 00000000 */ .word 0x00000000
/* 19CA2C 0029C92C 00000000 */ .word 0x00000000
