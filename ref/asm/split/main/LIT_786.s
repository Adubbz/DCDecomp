.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_786
/* 19F750 0029F650 63686172 */ .word 0x72616863
/* 19F754 0029F654 61666163 */ .word 0x63616661
/* 19F758 0029F658 65000000 */ .word 0x00000065
/* 19F75C 0029F65C 00000000 */ .word 0x00000000
