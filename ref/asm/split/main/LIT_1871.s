.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1871
/* 19ACF8 0029ABF8 73797374 */ .word 0x74737973
/* 19ACFC 0029ABFC 30380000 */ .word 0x00003830
