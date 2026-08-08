.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_613
/* 19C938 0029C838 6A75656C */ .word 0x6C65756A
/* 19C93C 0029C83C 6F70616C */ .word 0x6C61706F
/* 19C940 0029C840 00000000 */ .word 0x00000000
/* 19C944 0029C844 00000000 */ .word 0x00000000
