.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_904
/* 199630 00299530 3E000000 */ .word 0x0000003E
/* 199634 00299534 00000000 */ .word 0x00000000
/* 199638 00299538 00000000 */ .word 0x00000000
/* 19963C 0029953C 00000000 */ .word 0x00000000
