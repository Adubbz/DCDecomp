.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6250
/* 19DE50 0029DD50 6D656E75 */ .word 0x756E656D
/* 19DE54 0029DD54 6D6F7665 */ .word 0x65766F6D
/* 19DE58 0029DD58 00000000 */ .word 0x00000000
/* 19DE5C 0029DD5C 00000000 */ .word 0x00000000
