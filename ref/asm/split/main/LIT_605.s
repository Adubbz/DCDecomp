.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_605
/* 19C8B8 0029C7B8 6A75656C */ .word 0x6C65756A
/* 19C8BC 0029C7BC 616D7374 */ .word 0x74736D61
/* 19C8C0 0029C7C0 00000000 */ .word 0x00000000
/* 19C8C4 0029C7C4 00000000 */ .word 0x00000000
