.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_679
/* 1994B8 002993B8 2E6D6573 */ .word 0x73656D2E
/* 1994BC 002993BC 00000000 */ .word 0x00000000
