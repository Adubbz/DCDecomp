.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_279
/* 199E20 00299D20 6B690000 */ .word 0x0000696B
/* 199E24 00299D24 00000000 */ .word 0x00000000
