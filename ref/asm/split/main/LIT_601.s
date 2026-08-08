.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_601
/* 19C888 0029C788 61746461 */ .word 0x61647461
/* 19C88C 0029C78C 6D616765 */ .word 0x6567616D
/* 19C890 0029C790 00000000 */ .word 0x00000000
/* 19C894 0029C794 00000000 */ .word 0x00000000
