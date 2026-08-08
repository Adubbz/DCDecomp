.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_350__2
/* 19A778 0029A678 46495245 */ .word 0x45524946
/* 19A77C 0029A67C 00000000 */ .word 0x00000000
