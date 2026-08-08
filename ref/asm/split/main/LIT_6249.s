.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6249
/* 19DE40 0029DD40 6D656E75 */ .word 0x756E656D
/* 19DE44 0029DD44 6D6F7665 */ .word 0x65766F6D
/* 19DE48 0029DD48 2E696D67 */ .word 0x676D692E
/* 19DE4C 0029DD4C 00000000 */ .word 0x00000000
