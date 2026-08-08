.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_845__2
/* 19F4B8 0029F3B8 775F7265 */ .word 0x65725F77
/* 19F4BC 0029F3BC 636F7665 */ .word 0x65766F63
/* 19F4C0 0029F3C0 722E6368 */ .word 0x68632E72
/* 19F4C4 0029F3C4 72000000 */ .word 0x00000072
