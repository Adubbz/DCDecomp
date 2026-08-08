.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_319
/* 199FB8 00299EB8 6D650000 */ .word 0x0000656D
/* 199FBC 00299EBC 00000000 */ .word 0x00000000
