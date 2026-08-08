.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_970__2
/* 19DF40 0029DE40 322E696D */ .word 0x6D692E32
/* 19DF44 0029DE44 67000000 */ .word 0x00000067
