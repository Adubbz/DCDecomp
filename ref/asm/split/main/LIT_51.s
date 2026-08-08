.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_51
/* 19F8F8 0029F7F8 25730000 */ .word 0x00007325
/* 19F8FC 0029F7FC 00000000 */ .word 0x00000000
