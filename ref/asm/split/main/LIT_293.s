.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_293
/* 199EB8 00299DB8 68656269 */ .word 0x69626568
/* 199EBC 00299DBC 00000000 */ .word 0x00000000
