.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_17
/* 19F888 0029F788 73746163 */ .word 0x63617473
/* 19F88C 0029F78C 6B206F76 */ .word 0x766F206B
/* 19F890 0029F790 6572666C */ .word 0x6C667265
/* 19F894 0029F794 6F770000 */ .word 0x0000776F
/* 19F898 0029F798 00000000 */ .word 0x00000000
/* 19F89C 0029F79C 00000000 */ .word 0x00000000
