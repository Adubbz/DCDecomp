.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_259
/* 199D68 00299C68 73796172 */ .word 0x72617973
/* 199D6C 00299C6C 696E0000 */ .word 0x00006E69
